# Because feed aggregators usually do not have CSS feature,
# one may want to use dedicated markdown rendering logic for feed.
# The following patches are for making documents capable of having
# alternative contents for feed.

return if ENV['JEKYLL_NO_FEED']

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::DocumentFeedContentPatch
		Document.prepend self

		attr_reader :feed_source
		def feed_source= source
			@feed_source = source
			@feed_content = nil
		end

		def feed_content
			return content unless @feed_source
			return @feed_content if @feed_content
			converter = site.find_converter_instance Converters::Markdown
			@feed_content = converter.respond_to?(:convert_feed) ? converter.convert_feed(feed_source) : content
		end
	end

	module UlyssesZhan::RendererFeedContentPatch
		Renderer.prepend self

		def convert content
			document.feed_source = content if document.is_a?(Document) && document.type == :posts
			super
		end
	end

	module UlyssesZhan::DocumentDropFeedContentPatch
		Drops::DocumentDrop.prepend self
		Drops::DocumentDrop.instance_variable_set :@getter_method_names, nil

		def feed_content
			@obj.respond_to?(:feed_content) ? @obj.feed_content : content
		end
	end

	module UlyssesZhan::MarkdownFeedConverterPatch
		Converters::Markdown.prepend self

		def convert_feed content
			setup
			@parser.respond_to?(:convert_feed) ? @parser.convert_feed(content) : convert(content)
		end
	end
end
