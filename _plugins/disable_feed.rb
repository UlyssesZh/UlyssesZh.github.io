# feed depends on post contents,
# so it gets generated every time a post changes in incremental build
# disable the feed without needing to set `disabled_in_development`

return unless ENV['JEKYLL_NO_FEED']

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::FeedGeneratorDisablePatches
		JekyllFeed::Generator.prepend self

		def disabled_in_development?
			true
		end
	end
end
