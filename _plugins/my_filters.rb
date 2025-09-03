require 'nokogiri'

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
			UlyssesZhan.markdown_snippet_cache[input] ||= Filters.instance_method(:markdownify).bind_call self, input
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

		def strip_index input
			result = input.sub %r{/index\.html$}, ''
			result.empty? ? '/' : result
		end

		def external_links input
			doc = Nokogiri::HTML::DocumentFragment.parse input
			doc.css('a').each do |a|
				next if a['href'].downcase.start_with? @context.registers[:site].config['url'].downcase
				next if !a['href'].start_with?('http') && !a['href'].start_with?('//')
				a['target'] = '_blank'
				rel = a['rel']&.split || []
				rel.delete 'tag'
				rel.push 'external' unless rel.include? 'external'
				a['rel'] = rel.join ' '
			end
			doc.to_html
		end
	end
end
Liquid::Template.register_filter Jekyll::UlyssesZhan::Filters
