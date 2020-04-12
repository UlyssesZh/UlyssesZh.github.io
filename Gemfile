# frozen_string_literal: true

source 'https://rubygems.org'
gem 'minima', '~> 2.5'
group :jekyll_plugins do
	gem 'github-pages'
	gem 'jekyll-archives'
	gem 'jekyll-feed', '~> 0.12'
	gem 'jekyll-sitemap'
end
install_if -> { RUBY_PLATFORM =~ /mingw|mswin|java/ } do
	gem 'tzinfo', '~> 1.2'
	gem 'tzinfo-data'
end
gem 'faraday', '~> 0'
gem 'wdm', '~> 0.1.1', install_if: Gem.win_platform?
