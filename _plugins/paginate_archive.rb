# frozen_string_literal: true

module Jekyll
	class UlyssesZhan::ArchivePaginationGenerator < Generator
		LOG = false
		safe true
		priority :lowest
		def generate site
			@site = site
			@config = Jekyll::Utils.deep_merge_hashes Jekyll::PaginateV2::Generator::DEFAULT, site.config['pagination'] || {}
			@site.config['archives'].each do |archive|
				@archive = archive
				run_pagination_model
			end
		end
		def log message, type = 'info'
			case type
			when 'debug'
				Jekyll.logger.debug 'Archive pagination:', message
			when 'error'
				Jekyll.logger.error 'Archive pagination:', message
			when 'warn'
				Jekyll.logger.warn 'Archive pagination:', message
			else
				Jekyll.logger.info 'Archive pagination:', message
			end if LOG
		end
		def collection_by_name collection_name
			@archive.posts
		end
		def page_add new_page
			@site.pages.push new_page
			new_page
		end
		def page_remove page_to_remove
			@site.pages.delete page_to_remove
		end
		def run_pagination_model
			@config['permalink'] = File.join @archive.url, 'page/:num/'
			@archive.data['pagination'] = {'enabled' => true}
			@archive.data['date'] = @archive.date
			model = Jekyll::PaginateV2::Generator::PaginationModel.new method(:log), method(:page_add), method(:page_remove), method(:collection_by_name)
			count = model.run @config, [@archive], @archive.title
			Jekyll.logger.info "Archive pagination:", "Complete #{count} pages for #{@archive.title} #{@archive.date}" if LOG
			@archive.data.delete 'pagination'
		end
	end
end
