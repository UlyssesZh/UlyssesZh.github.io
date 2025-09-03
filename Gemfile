source 'https://rubygems.org/'

gem 'highline'
gem 'rake'
gem 'tomlib'
gem 'rqrcode'

gem 'jekyll', '~> 4'
gem 'minima', github: 'jekyll/minima', ref: 'master'
group :jekyll_plugins do
	install_if !ENV['JEKYLL_NO_ARCHIVE'] do
		gem 'jekyll-archives'
		gem 'jekyll-feed'
		gem 'jekyll-sitemap'
	end
	gem 'jekyll-paginate-v2', github: 'sverrirs/jekyll-paginate-v2', ref: 'master'
	gem 'jekyll-toc'
	gem 'jekyll-paru'
	gem 'jekyll-seo-tag'
end
gem 'wdm', install_if: Gem.win_platform?
gem 'webrick', install_if: RUBY_VERSION >= '3.0.0'
