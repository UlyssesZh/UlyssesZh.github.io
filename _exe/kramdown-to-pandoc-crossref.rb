#!/usr/bin/env ruby
# frozen_string_literal: true

class String
	def slugify
		gsub(/[^a-zA-Z0-9]+/, '-').gsub(/^-|-$/, '')
	end
	def slugify!
		gsub! /[^a-zA-Z0-9]+/, '-'
		gsub! /^-|-$/, ''
	end
end

filename = ARGV[0]
abort 'No filename specified.' unless filename

label_to_converted = {}
converted_to_label = {}

content = File.read filename
content.gsub! %r!
	\$\$
	\s*\\begin\{equation\}
	(\s*\\label\{(?<label1>.+?)\})?
	\s*(?<equation>.+?)
	(\s*\\label\{(?<label2>.+?)\})?
	\s*\\end\{equation\}
	\s*\$\$
!xm do |substring|
	if label = $~[:label1] || $~[:label2]
		unless converted = label_to_converted[label]
			converted = label.slugify
			converted.concat '-0' while converted_to_label[converted]
			label_to_converted[label] = converted
			converted_to_label[converted] = label
		end
		<<~LATEX.chomp
			$$#{$~[:equation]}$$ {#eq:#{converted}}
		LATEX
	else
		<<~LATEX.chomp
			$$#{$~[:equation]}$$
		LATEX
	end
end
content.gsub! %r!
	\\ref\{(?<label>.+?)\}
!x do
	label = $~[:label]
	unless converted = label_to_converted[label]
		converted = label.slugify
		converted.concat '-0' while converted_to_label[converted]
		label_to_converted[label] = converted
		converted_to_label[converted] = label
	end
	<<~LATEX.chomp
		[@eq:#{converted}]
	LATEX
end

File.write filename, content
