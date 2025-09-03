require 'table_of_contents/parser'

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::PatchTOC
		TableOfContents::Parser.prepend self

		def parse_content
			headers = Hash.new(0)

			(@doc.css(toc_headings) - @doc.css(toc_headings_in_no_toc_section))
			.reject { |n| n.classes.include?(@configuration.no_toc_class) }
			.inject([]) do |entries, node|
				id = node.attribute('id') || generate_toc_id(node.text)

				suffix_num = headers[id]
				headers[id] += 1

				node.search('a[class=anchor]')&.remove

				entries << {
					id: suffix_num.zero? ? id : "#{id}-#{suffix_num}",
					text: node.inner_html,
					node_name: node.name,
					header_content: node.children.first,
					h_num: node.name.delete('h').to_i
				}
			end
		end
	end
end
