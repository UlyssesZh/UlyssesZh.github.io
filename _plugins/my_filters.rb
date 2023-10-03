# frozen_string_literal: true

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::Filters
		def markdownify_no_p input
			html = Jekyll::Filters.instance_method(:markdownify).bind_call self, input
			html.sub %r{^<p>(.*?)</p>$}, '\1'
		end

		def newline_to_space input
			input.gsub ?\n, ?\s
		end

		def strip_lineno input
			input.gsub %r{<td class="rouge-gutter gl">.*?</td>}m, ''
		end
	end
end
Liquid::Template.register_filter Jekyll::UlyssesZhan::Filters
