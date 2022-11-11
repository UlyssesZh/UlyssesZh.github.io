# frozen_string_literal: true

module Jekyll
	module UlyssesZhan::Filters
		def markdownify_no_p input
			html = Jekyll::Filters.instance_method(:markdownify).bind_call self, input
			html.sub %r{^<p>(.*?)</p>$}, '\1'
		end
	end
end
Liquid::Template.register_filter Jekyll::UlyssesZhan::Filters
