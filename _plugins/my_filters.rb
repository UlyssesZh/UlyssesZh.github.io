require 'nokogiri'

module Jekyll::UlyssesZhan
	@markdownify_cache = {}
	@markdownify_feed_cache = {}
	@markdownify_strip_cache = {}
	singleton_class.attr_reader :markdownify_cache, :markdownify_feed_cache, :markdownify_strip_cache
end

module Jekyll
	module UlyssesZhan::Filters

		SeoTag::Filters.include self

		def markdownify input
			return input if @context.registers[:site].config['avoid_markdown']
			UlyssesZhan.markdownify_cache[input] ||= Filters.instance_method(:markdownify).bind_call self, input
		end

		def markdownify_no_p input
			markdownify(input).sub %r{^\s*<p>\s*(.*?)\s*</p>\s*$}m, '\1'
		end

		def markdownify_feed input
			return input if @context.registers[:site].config['avoid_markdown']
			UlyssesZhan.markdownify_feed_cache[input] ||= begin
				converter = @context.registers[:site].find_converter_instance Jekyll::Converters::Markdown
				if converter.respond_to? :convert_feed
					converter.convert_feed input
				else
					converter.convert input
				end
			end
		end

		def markdownify_feed_no_p input
			markdownify_feed(input).sub %r{^\s*<p>\s*(.*?)\s*</p>\s*$}m, '\1'
		end

		def newline_to_space input
			input.gsub ?\n, ?\s
		end

		def markdownify_strip input
			return input if @context.registers[:site].config['avoid_markdown']
			UlyssesZhan.markdownify_strip_cache[input] ||= strip_html2 markdownify input
		end

		# also strips aria-hidden and annotation (in MathML)
		def strip_html2 input
			doc = Nokogiri::HTML::DocumentFragment.parse "<body>#{input}</body>"
			doc.css('annotation, [aria-hidden="true"]').remove
			doc.text.strip
		end

		def cdata input
			"<![CDATA[#{input.gsub ']]>', ']]]]><![CDATA[>'}]]>"
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
