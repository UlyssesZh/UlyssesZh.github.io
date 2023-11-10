# frozen_string_literal: true

source 'https://rubygems.org/'

gem 'highline'
gem 'rake'

gem 'jekyll', '~> 4'
gem 'minima', github: 'jekyll/minima', ref: '85374864e0311f544f49139078927b41ecbe8792'
group :jekyll_plugins do
	install_if !ENV['JEKYLL_NO_ARCHIVE'] do
		gem 'jekyll-archives'
		gem 'jekyll-feed'
		gem 'jekyll-sitemap'
	end
	gem 'jekyll-paginate-v2'
	gem 'jekyll-toc'
	gem 'jekyll-paru'
	gem 'jekyll-seo-tag'
end
install_if RUBY_PLATFORM =~ /mingw|mswin|java/ do
	gem 'tzinfo', '~> 1.2'
	gem 'tzinfo-data'
end
gem 'faraday'
gem 'wdm', install_if: Gem.win_platform?
gem 'webrick', install_if: RUBY_VERSION >= '3.0.0'
