source 'https://rubygems.org/'

gem 'rake'
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
	gem 'jekyll-seo-tag'
end
gem 'wdm', install_if: Gem.win_platform?
gem 'webrick', install_if: RUBY_VERSION >= '3.0.0'

gem 'mdl'

# The Markdown pipeline is implemented in Haskell (FFI) and JavaScript
# (MiniRacer/KaTeX).  MessagePack is used on the Ruby <-> Haskell boundary.
gem 'mini_racer'
gem 'msgpack'
gem 'fiddle'
