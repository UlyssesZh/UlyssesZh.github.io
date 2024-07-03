#!/usr/bin/env ruby
# frozen_string_literal: true

require 'paru/filter'
require 'rouge'
require 'yaml'

class Hash
	def merge_r! other
		merge! other do |key, item, other_item|
			if item.is_a? Hash and other_item.is_a? Hash
				item.merge_r! other_item
			else
				other_item
			end
		end
	end
end

class Paru::PandocFilter::Attr
	def []= key, value
		@data[key] = value
	end
end

module Paru::PandocFilter::ASTManipulation
	def insert index, *children
		@children.insert index, *children
	end
end

class Paru::PandocFilter::Node
	def replace_self node, *more_nodes
		if !has_parent? || is_root?
			unless more_nodes.empty?
				raise Error.new "Cannot replace multiple nodes at root level"
			end
			@children = node.children
			node.parent = nil
			return
		end
		nodes = [node, *more_nodes]
		if is_inline? && !nodes.all?(&:is_inline?)
			raise Error.new "Cannot replace inline node with block node"
		end
		index = parent.find_index self
		@replacement = node
		parent.remove_at index
		parent.insert index, *nodes
		nodes.each { _1.parent = parent }
	end

	def parents_hierarchy
		result = []
		node = self
		begin
			result.unshift node.class
		end while node = node.parent
		result
	end

	def print_children_hierarchy indent = 0
		return if [Paru::PandocFilter::Str, Paru::PandocFilter::Space, Paru::PandocFilter::Link, Paru::PandocFilter::SoftBreak].include? self.class
		STDERR.puts "#{'  ' * indent}#{self.class}"
		@children&.each { _1.print_children_hierarchy indent + 1 }
	end
end

# https://github.com/htdebeer/paru/pull/82
class Paru::PandocFilter::Math
	def display?
		'DisplayMath' == @math_type['t']
	end
	def inline?
		'InlineMath' == @math_type['t']
	end
end

# https://github.com/htdebeer/paru/issues/79
#Paru::PandocFilter::MARKDOWN2JSON.__send__ :preserve_tabs

AVAILABLE_FORMATTERS = %w[linewise line_highlighter line_table pygments table]

DEFAULT_CONFIG = {
	inline_theme: nil,
	formatter: 'pygments',
	formatter_options: {},
	lexer_options: {}
}

START, MIDDLE, FINISH = %w[start middle finish].map { "very_unlikely_numbered_equation_#{_1}".freeze }

Paru::Filter.run do
	before do |doc|
		@config = DEFAULT_CONFIG.dup
		if config_file = metadata['rougeConfig']
			@config.merge_r! YAML.load_file config_file, symbolize_names: true
		end
	end

	with 'CodeBlock' do |code_block|
		lang = code_block.attr.classes.first
		code = code_block.to_code_string
		lexer = Rouge::Lexer.find_fancy lang, code, @config[:lexer_options]
		lexer ||= Rouge::Lexers::PlainText.new @config[:lexer_options]
		base_formatter = if @config[:inline_theme]
			Rouge::Formatters::HTMLInline.new @config[:inline_theme]
		else
			Rouge::Formatters::HTML.new
		end
		abort "Unknown formatter #{@config[:formatter]}" unless AVAILABLE_FORMATTERS.include? @config[:formatter]
		formatter_options = @config[:formatter_options]
		formatter_options = formatter_options.transform_values { _1.is_a?(String) ? _1 % { lang: lexer.class.tag } : _1 }
		formatter_options = formatter_options[:css_class] if @config[:formatter] == 'pygments'
		formatter = Rouge::Formatter.find("html_#{@config[:formatter]}").new base_formatter, formatter_options
		code_block.replace_self Paru::PandocFilter::RawBlock.new ['html', formatter.format(lexer.lex code)]
	end

	with 'Link' do |link|
		next unless link.target.url =~ %r{^(https?:)?//}
		link.attr['target'] = '_blank'
		rel = link.attr['rel']&.split || []
		rel.push 'external' unless rel.include? 'external'
		link.attr['rel'] = rel.join ' '
	end

	# https://github.com/lierdakil/pandoc-crossref/issues/444#issuecomment-2201090324
	with 'Math' do |math|
		next unless math.display?
		next unless math.parent.is_a? Paru::PandocFilter::Span
		next unless math.parent.children.size == 1
		next unless /\A#{START} (.+) #{MIDDLE} (\d+) #{FINISH}\z/m =~ math.string
		eq, num = $1, $2
		math.parent.attr.classes.push 'katex-display-table'
		numbered = Paru::PandocFilter::Math.new [{'t'=>'DisplayMath'}, eq]
		numbered_span = Paru::PandocFilter::Span.new [['', 'katex-display-numbered', {}], []]
		numbered_span.append numbered
		number = Paru::PandocFilter::Math.new [{'t'=>'DisplayMath'}, "\\p{#{num}}"]
		number_span = Paru::PandocFilter::Span.new [['', 'katex-display-number', {}], []]
		number_span.append number
		math.replace_self numbered_span, number_span
	end
end
