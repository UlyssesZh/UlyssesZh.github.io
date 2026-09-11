require 'fiddle'
require 'mini_racer'
require 'msgpack'
require 'rouge'

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::MarkdownUtils
		private

		def symbolize_keys value
			case value
			when Hash
				value.each_with_object({}) { |(key, item), result| result[key.to_sym] = symbolize_keys item }
			when Array
				value.map { symbolize_keys _1 }
			else
				value
			end
		end

		def deep_dup value
			case value
			when Hash
				value.transform_values { deep_dup _1 }
			when Array
				value.map { deep_dup _1 }
			when String
				value.dup
			else
				value
			end
		end
	end

	class UlyssesZhan::Markdown
		Converters::Markdown::MyMarkdown = self

		include UlyssesZhan::MarkdownUtils

		def initialize config = {}
		end

		def convert content
			render content, false
		end

		def convert_feed content
			render content, true
		end

		def render content, feed
			ast = MessagePack.unpack UlyssesZhan::Pandoc.markdown_to_ast content
			UlyssesZhan::PandocFilter.apply ast, feed
			UlyssesZhan::Pandoc.ast_to_html(MessagePack.pack ast).force_encoding 'UTF-8'
		end
	end

	module UlyssesZhan::Pandoc
		LIBRARY_PATH = File.expand_path '../_lib/pandoc-bridge/libpandoc_bridge.so', __dir__

		def self.init site
			@lib = Fiddle.dlopen LIBRARY_PATH

			hs_init = function :hs_init_with_rtsopts, %i[voidp voidp], :void
			ENV['GHCRTS'] = "-N#{number_of_capabilities}"
			hs_init.call 0, 0

			config = site.config['my_markdown'] || {}
			options = MessagePack.pack({
				'pandoc' => config['pandoc'] || {},
				'crossref' => config['pandoc-crossref'] || {}
			})
			# avoid repeated serializations of the same options
			function(:pandocBridgeInit, %i[voidp size_t], :void).(Fiddle::Pointer[options], options.bytesize)

			@markdown_to_ast = function :pandocBridgeMarkdownToAst, %i[voidp size_t voidp voidp], :void
			@ast_to_html = function :pandocBridgeAstToHtml, %i[voidp size_t voidp voidp], :void
			@free = function :pandocBridgeFree, %i[voidp], :void
		end
		Hooks.register(:site, :after_init) { init _1 }

		TYPES = { voidp: Fiddle::TYPE_VOIDP, void: Fiddle::TYPE_VOID, size_t: Fiddle::TYPE_SIZE_T }.freeze
		def self.function name, args_types, return_type
			Fiddle::Function.new @lib[name.to_s], args_types.map(&TYPES), TYPES[return_type], need_gvl: false
		end

		def self.markdown_to_ast markdown
			call_bridge @markdown_to_ast, markdown.to_s.b
		end

		def self.ast_to_html ast
			call_bridge @ast_to_html, ast.b
		end

		def self.number_of_capabilities
			return 1 if ENV['JEKYLL_NO_MULTITHREAD']
			UlyssesZhan::MultithreadRenderingSitePatch::CONCURRENT_JOB_COUNT
		end

		def self.call_bridge function, input
			out_pointer = +?\0 * Fiddle::SIZEOF_VOIDP
			out_length = +?\0 * Fiddle::SIZEOF_SIZE_T
			function.(Fiddle::Pointer[input], input.bytesize, Fiddle::Pointer[out_pointer], Fiddle::Pointer[out_length])
			address = out_pointer.unpack1 ?J
			length = out_length.unpack1 ?J
			Fiddle::Pointer.new(address)[0, length]
		ensure
			@free.call Fiddle::Pointer.new address if defined?(address) && address && !address.zero?
		end
	end

	# modifies a Pandoc AST:
	# - replace code blocks with raw HTML blocks rendered by Rouge
	# - replace math with raw HTML inlines rendered by KaTeX
	# - add target="_blank" and rel="external" to external links
	module UlyssesZhan::PandocFilter
		extend UlyssesZhan::MarkdownUtils

		KATEX_BRIDGE_BUNDLE_PATH = File.expand_path '../_lib/katex-bridge/dist/katex-bridge.js', __dir__
		DEFAULT_ROUGE_CONFIG = {
			formatter: { tag: 'pygments' },
			lexer_options: {}
		}.freeze

		def self.init site
			config = site.config['my_markdown']&.[]('rouge') || {}
			@rouge_config = symbolize_keys({
				formatter: config['formatter'] || DEFAULT_ROUGE_CONFIG[:formatter],
				lexer_options: config['lexer_options'] || DEFAULT_ROUGE_CONFIG[:lexer_options],
			})
			@katex_bridge_bundle = File.read KATEX_BRIDGE_BUNDLE_PATH
			@katex_config = site.config['my_markdown']&.[]('katex') || {}
		end
		Hooks.register(:site, :after_init) { init _1 }

		def self.apply ast, feed
			walk ast['blocks'], feed
			ast
		end

		def self.walk value, feed
			case value
			when Array
				value.map! { walk _1, feed }
			when Hash
				case value['t']
				when 'CodeBlock'
					return code_block_to_raw value, feed
				when 'Link'
					external_link value
				when 'Math'
					return math_to_raw value, feed
				end
				value.transform_values! { walk _1, feed }
			else
				value
			end
		end

		def self.math_to_raw math, feed
			attr, tex = math['c']
			# create one context for each thread to achieve true parallellism, not merely concurrency
			context = Thread.current[:ulysseszhan_katex_context] ||= new_katex_context
			html = context.('render', tex, attr['t'] == 'DisplayMath', feed)
			{ 't' => 'RawInline', 'c' => ['html', html] }
		end

		def self.new_katex_context
			MiniRacer::Context.new.tap do |context|
				context.eval @katex_bridge_bundle, filename: KATEX_BRIDGE_BUNDLE_PATH
				context.('setOptions', @katex_config) # avoid repeated serializations of the same options
			end
		end

		def self.code_block_to_raw code_block, feed
			attr, code = code_block['c']
			lang = attr&.[](1)&.first
			code += ?\n unless code.end_with? ?\n # https://github.com/rouge-ruby/rouge/pull/2274
			lexer = Rouge::Lexer.find_fancy lang, code, @rouge_config[:lexer_options]
			lexer ||= Rouge::Lexers::PlainText.new @rouge_config[:lexer_options]
			if feed
				# use plain HTML code blocks in feed because this is the best without CSS
				html = "<pre><code>#{Rouge::Formatters::HTML.new.format lexer.lex code}</code></pre>"
			else
				html = get_formatter(lang, @rouge_config[:formatter]).format lexer.lex code
				# the preservation of newlines in <pre> is very hard to deal with when styling
				html.gsub! %r{<pre class="lineno">(.+?)</pre>}m, '<div class="lineno">\1</div>'
				# accessibility concern (<code> has the semantics and WAI-ARIA role of code)
				# https://github.com/rouge-ruby/rouge/pull/2276
				# remove after rouge updates to 5.x: https://github.com/jekyll/jekyll/issues/10003
				html.gsub! '<pre>', '<pre><code>'
				html.gsub! '</pre>', '</code></pre>'
				# https://github.com/rouge-ruby/rouge/pull/2275
				# remove after rouge updates to 5.x: https://github.com/jekyll/jekyll/issues/10003
				html.gsub! /(<td class="[^"]+ gl")([ >])/, '\1 aria-hidden="true"\2'
			end
			{ 't' => 'RawBlock', 'c' => ['html', html] }
		end

		def self.get_formatter lang, config
			tag, options, formatter = config.values_at :tag, :options, :formatter
			options = deep_dup options
			options.each_value { _1.gsub! '%{lang}', lang if _1.is_a? String } if options.is_a? Hash
			formatter_class = Rouge::Formatter.find tag
			# https://github.com/rouge-ruby/rouge/pull/2273
			# remove after rouge updates to 5.x: https://github.com/jekyll/jekyll/issues/10003
			formatter_class ||= Rouge::Formatters::HTMLLinewise if tag == 'html_linewise'
			return formatter_class.new options unless formatter
			formatter_class.new get_formatter(lang, formatter), options
		end

		def self.external_link link
			contents = link['c']
			return unless contents.is_a?(Array) && contents.length >= 3
			target = contents[2][0].to_s
			return unless target =~ %r{^(https?:)?//}
			attr = contents[0]
			attr[2] ||= []
			set_attr attr, 'target', '_blank'
			rel = (get_attr(attr, 'rel') || '').split
			rel.push 'external' unless rel.include? 'external'
			set_attr attr, 'rel', rel.join(' ')
		end

		def self.get_attr attr, key
			attr[2].find { |name, _| name == key }&.last
		end

		def self.set_attr attr, key, value
			if pair = attr[2].find { |name, _| name == key }
				pair[1] = value
			else
				attr[2].push [key, value]
			end
		end
	end
end
