return if ENV['JEKYLL_NO_ARCHIVE']

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::ArchiveUtils
		module_function
		def archives_structure site
			archives = site.config['archives']
			structure = {}
			archives.each do |archive|
				dir = URL.unescape_path(archive.url).gsub /^\//, ''
				current = structure
				dir.split(?/).tap(&:shift).each do |subdir|
					current = current[subdir] ||= {}
				end
				current['index.html'] = 'f'
			end
			structure
		end
	end
end
