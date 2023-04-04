# frozen_string_literal: true

module Jekyll::UlyssesZhan
end

module Jekyll
	class UlyssesZhan::FiguresGenerator < Generator
		safe true
		priority :high
		def generate site
			site.posts.docs.each do |page|
				dir_basename = page.basename.sub /\.md$/, ''
				dir_path = File.join site.config['figures_path'], dir_basename, ''
				page.data['figure'] ||= dir_path
			end
		end
	end
end
