module Jekyll::UlyssesZhan
end

module Jekyll
	class UlyssesZhan::CoversGenerator < Generator
		safe true
		priority :high
		def generate site
			site.posts.docs.each do |page|
				unless page.data['image']
					image_filename = page.basename.sub /\.md$/, '.png'
					image_path = File.join site.config['covers_path'], image_filename
					if File.exist? File.join Dir.pwd, image_path
						page.data['image'] = image_path
					end
				end
			end
		end
	end
end
