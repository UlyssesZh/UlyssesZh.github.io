# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'
require 'date'

module Jekyll::UlyssesZhan
end

module Jekyll
	class UlyssesZhan::FetchMastodonPost
		def initialize site
			@site = site
			setup
			fetch
			write
		end

		def setup
			@url = @site.config['minima']['social_links'].find { _1['icon'] == 'mastodon' }['url']
			@rss_url = @url + '.rss'
		end

		def fetch
			URI.open @rss_url do |rss|
				@feed = Nokogiri::XML rss
			end
			@post = @feed.xpath('//item').first
			@description = @post.xpath('description').first.content
			@images = @post.xpath('media:content[@medium="image"]')[...2].map do |content|
				{
					'url' => content['url'],
					'alt' => content.xpath('media:description').first&.content
				}
			end
			@link = @post.xpath('link').first.content
			@date = Time.parse(@post.xpath('pubDate').first.content).localtime # FUCK TZ
		end

		def write
			@site.config['mastodon_post'] = {
				'description' => @description,
				'images' => @images,
				'link' => @link,
				'date' => @date,
				'user_url' => @url
			}
		end
	end
end
