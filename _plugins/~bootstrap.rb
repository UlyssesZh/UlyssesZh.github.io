require 'json'

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::Bootstrap

		module_function

		def run site
			@site = site
			read_env
			read_commit
			read_katex_version
			fetch_mastodon_post
			read_github_run_id
		end
		Hooks.register(:site, :after_init) { run _1 }

		def read_katex_version
			lock = File.expand_path '../_lib/katex-bridge/node_modules/katex/package.json', __dir__
			@site.config['katex_version'] = JSON.load_file(lock)['version']
		end

		def read_env
			@site.config['url'] = ENV['JEKYLL_URL'] if ENV['JEKYLL_URL']
			@site.config['baseurl'] = ENV['JEKYLL_BASEURL'] if ENV['JEKYLL_BASEURL']
			@site.config['domain'] = ENV['JEKYLL_DOMAIN'] if ENV['JEKYLL_DOMAIN']
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
