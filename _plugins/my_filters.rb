# frozen_string_literal: true

module Jekyll::UlyssesZhan
	@markdown_snippet_cache = {}
	def self.markdown_snippet_cache
		@markdown_snippet_cache
	end
end

module Jekyll
	module UlyssesZhan::Filters

		def markdownify input
			return input if @context.registers[:site].config['avoid_markdown']
			UlyssesZhan.markdown_snippet_cache[input] ||= Jekyll::Filters.instance_method(:markdownify).bind_call self, input
		end

		def markdownify_no_p input
			markdownify(input).sub %r{^\s*<p>\s*(.*?)\s*</p>\s*$}m, '\1'
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
