module Jekyll::UlyssesZhan
end

module Jekyll

	module UlyssesZhan::TableOfContentsParserPatch
		TableOfContents::Parser.prepend self

		# https://github.com/toshimaru/jekyll-toc/issues/188
		# https://github.com/toshimaru/jekyll-toc/blob/v0.19.0/lib/table_of_contents/parser.rb#L25-L34
		def inject_anchors_into_html
			strip_html2 = UlyssesZhan::Filters.instance_method(:strip_html2).bind self
			@entries.each do |entry|
				# NOTE: `entry[:id]` is automatically URL encoded by Nokogiri
				entry[:header_content].add_previous_sibling(
					%(<a class="anchor" href="##{entry[:id]}" aria-label="Permalink: #{strip_html2.(entry[:text])}"></a>)
				)
			end

			@doc.inner_html
		end
	end
end
