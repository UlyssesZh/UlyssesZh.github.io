# frozen_string_literal: true

require 'kramdown/parser/kramdown'
require 'kramdown-parser-gfm'

class Kramdown::Parser::InlineMath < Kramdown::Parser::GFM
	# Override inline math parser
	@@parsers.delete(:inline_math)

	INLINE_MATH_START = /(\$+)([^\$]+)(\$+)/m

	def parse_inline_math
		start_line_number = @src.current_line_number
		@src.pos += @src.matched_size
		@tree.children << Element.new(:math, @src.matched[1..-2], nil, category: :span, location: start_line_number)
	end

	define_parser(:inline_math, INLINE_MATH_START, '\$')
end
