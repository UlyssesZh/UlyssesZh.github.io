#!/usr/bin/env ruby
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

	def clone_r
		transform_values do |item|
			item.is_a?(Hash) ? item.clone_r : item.clone
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

def get_formatter lang, config
	tag, options, formatter = config.values_at :tag, :options, :formatter
	options = options&.clone_r
	options.each_value { _1.gsub! '%{lang}', lang if _1.is_a? String } if options.is_a? Hash
	formatter_class = Rouge::Formatter.find tag
	formatter_class ||= Rouge::Formatters::HTMLLinewise if tag == 'html_linewise' # https://github.com/rouge-ruby/rouge/pull/2273
	return formatter_class.new options unless formatter
	formatter_class.new get_formatter(lang, formatter), options
end

DEFAULT_CONFIG = {
	formatter: {tag: 'pygments'},
	lexer_options: {}
}

START, MIDDLE, FINISH = %w[start middle finish].map { "very_unlikely_numbered_equation_#{_1}".freeze }

Paru::Filter.run do
	before do |doc|
		@config = DEFAULT_CONFIG.dup
		if config_file = metadata['rougeConfig']&.gsub(?\\, '') # Markdown escape backslashes; see https://github.com/jgm/pandoc/issues/7414
			@config.merge_r! YAML.load_file config_file, symbolize_names: true
		end
	end

	with 'CodeBlock' do |code_block|
		lang = code_block.attr.classes.first
		code = code_block.to_code_string
		code += ?\n unless code.end_with? ?\n # https://github.com/rouge-ruby/rouge/pull/2274
		lexer = Rouge::Lexer.find_fancy lang, code, @config[:lexer_options]
		lexer ||= Rouge::Lexers::PlainText.new @config[:lexer_options]
		html = get_formatter(lang, @config[:formatter]).format lexer.lex code
		# the preservation of newlines in <pre> is very hard to deal with when styling
		html.gsub!(%r{<pre class="lineno">(.+?)</pre>}m) { %{<div class="lineno">#$1</div>} }
		code_block.replace_self Paru::PandocFilter::RawBlock.new ['html', html]
	end

	with 'Link' do |link|
		next unless link.target.url =~ %r{^(https?:)?//}
		link.attr['target'] = '_blank'
		rel = link.attr['rel']&.split || []
		rel.push 'external' unless rel.include? 'external'
		link.attr['rel'] = rel.join ' '
	end

end
