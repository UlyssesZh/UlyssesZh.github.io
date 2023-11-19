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
		formatter_options = formatter_options[:css_class] if @config[:formatter] == 'pygments'
		formatter = Rouge::Formatter.find("html_#{@config[:formatter]}").new base_formatter, formatter_options
		code_block.markdown = formatter.format lexer.lex code
	end

	with 'Link' do |link|
		next unless link.target.url =~ %r{^(https?:)?//}
		link.attr['target'] = '_blank'
		rel = link.attr['rel']&.split || []
		rel.push 'external' unless rel.include? 'external'
		link.attr['rel'] = rel.join ' '
	end
end
