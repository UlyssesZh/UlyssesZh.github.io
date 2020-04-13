# frozen_string_literal: true

source 'https://rubygems.org'

gem 'jekyll', '~> 3.8'
gem 'minima', '~> 2.5'
group :jekyll_plugins do
	gem 'github-pages', '~> 204'
	gem 'jekyll-archives'
	gem 'jekyll-feed', '~> 0.13'
	gem 'jekyll-sitemap', '~> 1.4'
end
install_if -> { RUBY_PLATFORM =~ /mingw|mswin|java/ } do
	gem 'tzinfo', '~> 1.2'
	gem 'tzinfo-data'
end
gem 'faraday', '~> 0'
gem 'rubocop'
gem 'rubocop-rspec'
gem 'rubocop-performance'
gem 'wdm', '~> 0.1.1', install_if: Gem.win_platform?
