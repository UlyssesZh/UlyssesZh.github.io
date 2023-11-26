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

class Paru::PandocFilter::Node
	def replace_self node
		if !has_parent? || is_root?
			@children = node.children
			return
		end
		if is_inline? && !node.is_inline?
			raise Error.new "Cannot replace inline node #{markdown} with block node #{node.markdown}"
		end
		index = parent.find_index self
		@replacement = node
		parent.insert index, node
		parent.remove_at index + 1
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
end
