module Jekyll::UlyssesZhan
end

module Jekyll
	class UlyssesZhan::PublicGenerator < Generator
		safe true
		PUBLIC_DIR = '_public'
		def generate site
			Dir.glob File.join PUBLIC_DIR, '**/*' do |filename|
				next if File.directory? filename
				site.static_files.push UlyssesZhan::PublicStaticFile.new site, site.source, File.dirname(filename), File.basename(filename)
			end
		end
	end

	class UlyssesZhan::PublicStaticFile < StaticFile
		def cleaned_relative_path
			super.sub %r{^#{Regexp.escape UlyssesZhan::PublicGenerator::PUBLIC_DIR}/}, ''
		end
	end
end
