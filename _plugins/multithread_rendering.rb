# frozon_string_literal: true

return if ENV['JEKYLL_NO_MULTITHREAD']

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::MultithreadRenderingSitePatch

		CONCURRENT_JOB_COUNT = 20

		Site.prepend self
		Site.alias_method :actually_render_regenerated, :render_regenerated

		class RenderingJob

			def initialize site, document
				@site, @document = site, document
			end

			def run
				@thread = Thread.new do
					@site.__send__ :actually_render_regenerated, @document, @site.site_payload
				end
			end

			def finished?
				!@thread.status
			end
		end

		attr_reader :queue_clear

		def render ...
			@rendering_jobs = Hash.new { |jobs, priority| jobs[priority] = Set[] }
			super
		end

		def render_regenerated document, _
			@rendering_jobs[
				case priority_data = document.data['rendering_priority']
				when nil then 0
				when Numeric then priority_data
				when String, Symbol then Plugin::PRIORITIES[priority_data.to_sym]
				else raise "Invalid rendering priority: #{priority_data.inspect}"
				end
			].add RenderingJob.new self, document
		end

		def render_pages ...
			super
			@rendering_jobs.sort_by { |priority, _| -priority }.each do |_, jobs|
				running = Set.new
				while !running.empty? || !jobs.empty?
					while running.size < CONCURRENT_JOB_COUNT && (job = jobs.each.first&.tap &:run)
						running.add job
						jobs.delete job
					end
					sleep 1
					running.delete_if &:finished?
				end
			end
		end
	end

	module UlyssesZhan::LiquidRendererFilePatch

		LiquidRenderer::File.prepend self

		def parse content
			measure_time { @template = Liquid::Template.parse content, line_numbers: true }
			self
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
