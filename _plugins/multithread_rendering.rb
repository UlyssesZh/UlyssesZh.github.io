# frozon_string_literal: true

return if ENV['JEKYLL_NO_MULTITHREAD']

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::MultithreadRenderingSitePatch

		CONCURRENT_JOB_COUNT = ENV['JEKYLL_CONCURRENT_JOB_COUNT']&.to_i || 16
		DOCUMENTS_PER_JOB = ENV['JEKYLL_DOCUMENTS_PER_JOB']&.to_i || 5

		Site.prepend self
		Site.alias_method :actually_render_regenerated, :render_regenerated

		class RenderingJob

			attr_reader :documents

			def initialize site
				@site = site
				@documents = []
			end

			def run queue, product
				Thread.new do
					payload = @site.site_payload
					@documents.each do |document|
						@site.__send__ :actually_render_regenerated, document, payload
					end
					queue.push product
				end
				self
			end
		end

		attr_reader :queue_clear

		def render ...
			@rendering_jobs = Hash.new { |jobs, priority| jobs[priority] = [RenderingJob.new(self)] }
			super
		end

		def render_regenerated document, _
			jobs = @rendering_jobs[
				case priority_data = document.data['rendering_priority']
				when nil then 0
				when Numeric then priority_data
				when String, Symbol then Plugin::PRIORITIES[priority_data.to_sym]
				else raise "Invalid rendering priority: #{priority_data.inspect}"
				end
			]
			job = jobs.last
			jobs.push job = RenderingJob.new(self) if job.documents.size >= DOCUMENTS_PER_JOB
			job.documents.push document
		end

		def render_pages ...
			super
			queue = Thread::Queue.new
			@rendering_jobs.sort_by { |priority, _| -priority }.each do |_, jobs|
				running = jobs[0...CONCURRENT_JOB_COUNT].each_with_index { _1.run queue, _2 }
				jobs.size.times do |i|
					i += CONCURRENT_JOB_COUNT
					running[queue.shift] = jobs[i]&.run queue, i
				end
			end
		end
	end

	module UlyssesZhan::LiquidRendererFilePatch

		LiquidRenderer::File.prepend self

		# https://github.com/jekyll/jekyll/issues/9485#issuecomment-1797873978
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
	end if const_defined? :JekyllFeed

	module UlyssesZhan::ArchiveRenderingPriorityPatch
		Archives::Archive.prepend self
		def initialize ...
			super
			@data['rendering_priority'] = :lowest
		end
	end if const_defined? :Archives

	module UlyssesZhan::SitemapRenderingPriorityPatch
		JekyllSitemap.prepend self
		def sitemap ...
			super.tap { _1.data['rendering_priority'] = :lowest }
		end
		def robots ...
			super.tap { _1.data['rendering_priority'] = :lowest }
		end
	end if const_defined? :JekyllSitemap

	# https://github.com/jekyll/jekyll-sass-converter/issues/159
	if Converters.const_defined? :Scss
		module UlyssesZhan::SassSourceMapRenderingPriorityPatch
			SourceMapPage.prepend self
			def initialize ...
				super
				@data['rendering_priority'] = :lowest
			end
		end
		module UlyssesZhan::SassSourceMapGenerationPatch
			Converters::Scss.prepend self
			def generate_source_map_page ...
				return unless super
				site.render_regenerated source_map_page, site.site_payload
			end
		end
	end
end
