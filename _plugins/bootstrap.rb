# frozen_string_literal: true

require 'fileutils'
require 'katex'

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::Bootstrap
		module_function

		def run
			if @site.config['kramdown']['math_engine'] == 'katex'
				copy_katex_stylesheet
				copy_katex_fonts
			end
		end

		def register
			Hooks.register :site, :after_init do |site|
				@site = site
				run
			end
		end

		def copy_katex_stylesheet
			katex_scss = File.join Katex.gem_path, 'vendor/katex/sprockets/stylesheets/_katex.scss'
			sass_bootstrap = File.join @site.source, '_sass/bootstrap'
			return if File.exist? sass_bootstrap
			FileUtils.mkdir_p File.dirname sass_bootstrap
			FileUtils.cp katex_scss, sass_bootstrap
		end

		def copy_katex_fonts
			katex_fonts = File.join Katex.gem_path, 'vendor/katex/fonts'
			assets_bootstrap = File.join @site.source, 'assets/bootstrap/fonts'
			return if File.exist? assets_bootstrap
			FileUtils.mkdir_p File.dirname assets_bootstrap
			FileUtils.cp_r katex_fonts, assets_bootstrap
		end
	end

end

Jekyll::UlyssesZhan::Bootstrap.register
