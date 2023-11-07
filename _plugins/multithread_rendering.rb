# frozon_string_literal: true

return

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::MultithreadRendering

		CONCURRENT_JOB_COUNT = 20

		Site.prepend self
		Site.alias_method :actually_render_regenerated, :render_regenerated

		class RenderingJobFinished < Exception
			attr_reader :job
			def initialize job
				@job = job
			end
		end

		class RenderingJob
			def initialize site, document, payload
				@site, @document, @payload = site, document, payload
			end

			def run
				Thread.new do
					@site.__send__ :actually_render_regenerated, @document, @payload
					Thread.main.raise RenderingJobFinished.new self unless @site.queue_clear
				end
			end
		end

		attr_reader :queue_clear

		def render ...
			@rendering_jobs = Hash.new { |jobs, priority| jobs[priority] = Set[] }
			super
		end

		def render_regenerated document, payload
			@rendering_jobs[
				case priority_data = document.data['rendering_priority']
				when nil then 0
				when Numeric then priority_data
				when String, Symbol then Plugin::PRIORITIES[priority_data.to_sym]
				else raise "Invalid rendering priority: #{priority_data.inspect}"
				end
			].add RenderingJob.new self, document, payload.dup
		end

		def render_pages ...
			super
			@rendering_jobs.sort_by { |priority, _| -priority }.each do |_, jobs|
				@queue_clear = false
				running = Set.new
				running.add jobs.delete jobs.each.first.tap &:run while running.size < CONCURRENT_JOB_COUNT
				begin
					sleep
				rescue RenderingJobFinished => e
					running.delete e.job
					unless jobs.empty?
						running.add jobs.delete jobs.each.first.tap &:run
						retry
					end
				end
				@queue_clear = true
				running.each &:join
			end
		end
	end

	module UlyssesZhan::FeedRenderingPrioirityPatch
		JekyllFeed::Generator.prepend self
		def make_page ...
			super.tap { _1.data['rendering_priority'] = :lowest }
		end
	end if Jekyll.const_defined? :JekyllFeed

	module UlyssesZhan::ArchiveRenderingPriorityPatch
		Archives::Archive.prepend self
		def initialize ...
			super
			@data['rendering_priority'] = :lowest
		end
	end if Jekyll.const_defined? :Archives

	module UlyssesZhan::SitemapRenderingPriorityPatch
		JekyllSitemap.prepend self
		def sitemap ...
			super.tap { _1.data['rendering_priority'] = :lowest }
		end
		def robots ...
			super.tap { _1.data['rendering_priority'] = :lowest }
		end
	end if Jekyll.const_defined? :JekyllSitemap
end
