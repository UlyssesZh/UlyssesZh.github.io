# frozen_string_literal: true

require 'fileutils'
require 'yaml'

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::Bootstrap

		BOOTSTRAP_DIR = 'bootstrap'

		module_function

		def run
			FileUtils.mkdir_p BOOTSTRAP_DIR
			read_env
			read_katex_version
			write_crossref_config
			write_rouge_config
		end

		def register
			Hooks.register :site, :after_init do |site|
				@site = site
				run
			end
		end

		def read_katex_version
			@site.config['katex_version'] = `pandoc-katex --katex-version`.chomp
		end

		def write_crossref_config
			yaml = YAML.dump @site.config['paru']['crossref'].transform_keys { _1.to_s.gsub(/_(\w)/) { $1.upcase } }
			File.write File.join(BOOTSTRAP_DIR, 'crossref.yml'), yaml.tap { _1["---\n"] = '' }
		end

		def write_rouge_config
			File.write File.join(BOOTSTRAP_DIR, 'rouge.yml'), YAML.dump(@site.config['paru']['rouge'])
		end

		def read_env
			@site.config['avoid_markdown'] = !!ENV['JEKYLL_AVOID_MARKDOWN']
			@site.config['no_archive'] = !!ENV['JEKYLL_NO_ARCHIVE']
		end
	end

end

Jekyll::UlyssesZhan::Bootstrap.register
