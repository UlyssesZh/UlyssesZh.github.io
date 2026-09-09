require 'json'

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::Bootstrap

		module_function

		def run
			read_env
			read_commit
			read_katex_version
			fetch_mastodon_post
			read_github_run_id
		end

		def register
			Hooks.register :site, :after_init do |site|
				@site = site
				run
			end
		end

		def read_katex_version
			package = File.expand_path '_lib/katex-bridge/node_modules/katex/package.json'
			version = JSON.parse(File.read(package))['version'] if File.file? package
			@site.config['katex_version'] = version || '0.16.11'
		end

		def read_env
			@site.config['avoid_markdown'] = !!ENV['JEKYLL_AVOID_MARKDOWN']
			@site.config['no_archive'] = !!ENV['JEKYLL_NO_ARCHIVE']
		end

		def read_commit
			@site.config['commit_hash'] = `git rev-parse HEAD`.chomp
			@site.config['commit_time'] = Time.at `git show -s --format=%ct`.to_i
		end

		def fetch_mastodon_post
			@fetch_mastodon_post = UlyssesZhan::FetchMastodonPost.new @site
		end

		def read_github_run_id
			@site.config['github_run_id'] = ENV['GITHUB_RUN_ID']
		end
	end
end

Jekyll::UlyssesZhan::Bootstrap.register
