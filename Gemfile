# frozen_string_literal: true

source 'https://rubygems.org/'

gem 'jekyll', '~> 4'
gem 'jekyll-sass-converter', '< 3' # https://github.com/helaili/jekyll-action/issues/150
gem 'minima'
group :jekyll_plugins do
	gem 'jekyll-archives'
	gem 'jekyll-feed'
	gem 'jekyll-paginate-v2'
	gem 'jekyll-sitemap'
	gem 'jekyll-toc'
end
install_if -> { RUBY_PLATFORM =~ /mingw|mswin|java/ } do
	gem 'tzinfo', '~> 1.2'
	gem 'tzinfo-data'
end
gem 'faraday'
gem 'wdm', install_if: Gem.win_platform?
gem 'webrick', install_if: RUBY_VERSION >= '3.0.0'
