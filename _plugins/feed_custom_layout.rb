return if ENV['JEKYLL_NO_FEED']

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::FeedGeneratorCustomLayoutPatches
		JekyllFeed::Generator.prepend self

		def feed_source_path
			@feed_source_path ||= File.join @site.in_source_dir(@site.config['layouts_dir']), 'feed.xml'
		end
	end
end
