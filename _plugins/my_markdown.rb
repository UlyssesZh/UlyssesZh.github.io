require 'fiddle'
require 'mini_racer'
require 'msgpack'
require 'rouge'
require 'yaml'

module Jekyll
	module UlyssesZhan
		module MyMarkdown

			module FFI
				extend self

				@init_mutex = Mutex.new
				@lib = nil
				@markdown_to_ast = nil
				@ast_to_html = nil
				@free = nil

				def init
					@init_mutex.synchronize do
						return if @lib

						ENV['GHCRTS'] = "-N#{number_of_capabilities}"
						@lib = Fiddle.dlopen library_path
						hs_init = Fiddle::Function.new(
							@lib['hs_init_with_rtsopts'],
							[Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP],
							Fiddle::TYPE_VOID
						)
						hs_init.call 0, 0
						@markdown_to_ast = Fiddle::Function.new(
							@lib['pandocBridgeMarkdownToAst'],
							[
								Fiddle::TYPE_VOIDP, Fiddle::TYPE_SIZE_T,
								Fiddle::TYPE_VOIDP, Fiddle::TYPE_SIZE_T,
								Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP
							],
							Fiddle::TYPE_VOID,
							need_gvl: false
						)
						@ast_to_html = Fiddle::Function.new(
							@lib['pandocBridgeAstToHtml'],
							[
								Fiddle::TYPE_VOIDP, Fiddle::TYPE_SIZE_T,
								Fiddle::TYPE_VOIDP, Fiddle::TYPE_SIZE_T,
								Fiddle::TYPE_VOIDP, Fiddle::TYPE_VOIDP
							],
							Fiddle::TYPE_VOID,
							need_gvl: false
						)
						@free = Fiddle::Function.new(
							@lib['pandocBridgeFree'],
							[Fiddle::TYPE_VOIDP],
							Fiddle::TYPE_VOID,
							need_gvl: false
						)
					end
					self
				end

				def markdown_to_ast markdown, options = {}
					init
					call_bridge @markdown_to_ast, markdown.to_s.b, MessagePack.pack(options)
				end

				def ast_to_html ast, options = {}
					init
					call_bridge @ast_to_html, ast.b, MessagePack.pack(options)
				end

				private

				def library_path
					ENV['PANDOC_BRIDGE_LIB'] || File.expand_path('../_lib/pandoc-bridge/libpandoc_bridge.so', __dir__)
				end

				def number_of_capabilities
					return 1 if ENV['JEKYLL_NO_MULTITHREAD']

					count = ENV['JEKYLL_CONCURRENT_JOB_COUNT']&.to_i
					if count.nil? || count.zero?
						count = if defined?(Jekyll::UlyssesZhan::MultithreadRenderingSitePatch::CONCURRENT_JOB_COUNT)
							Jekyll::UlyssesZhan::MultithreadRenderingSitePatch::CONCURRENT_JOB_COUNT
						else
							16
						end
					end
					[count, 1].max
				end

				def call_bridge function, input, options
					out_pointer = +"\0" * Fiddle::SIZEOF_VOIDP
					out_length = +"\0" * Fiddle::SIZEOF_SIZE_T
					function.call(
						Fiddle::Pointer[input], input.bytesize,
						Fiddle::Pointer[options], options.bytesize,
						Fiddle::Pointer[out_pointer], Fiddle::Pointer[out_length]
					)
					address = out_pointer.unpack1 'J'
					length = out_length.unpack1 'J'
					address.zero? || length.zero? ? ''.b : Fiddle::Pointer.new(address)[0, length]
				ensure
					@free.call Fiddle::Pointer.new(address) if defined?(address) && address && !address.zero?
				end
			end

			module Katex
				extend self

				BUNDLE_PATH = File.expand_path('../_lib/katex-bridge/dist/katex-bridge.js', __dir__)

				@bundle_mutex = Mutex.new
				@bundle = nil

				def render ast, options = {}
					Thread.current[:my_markdown_katex_ast] = ast.b
					context.call 'renderMath', options
				ensure
					Thread.current[:my_markdown_katex_ast] = nil
				end

				private

				def context
					Thread.current[:my_markdown_katex_context] ||= begin
						context = MiniRacer::Context.new
						context.attach 'getPandocAst', -> {
							MiniRacer::Binary.new(Thread.current[:my_markdown_katex_ast] || ''.b)
						}
						context.eval bundle, filename: BUNDLE_PATH
						context
					end
				end

				def bundle
					@bundle_mutex.synchronize do
						@bundle ||= File.read BUNDLE_PATH
					end
				end
			end

			module Filter
				DEFAULT_CONFIG = {
					formatter: { tag: 'pygments' },
					lexer_options: {}
				}.freeze

				module_function

				def apply! ast, config: {}, feed: false
					state = normalize_config config, feed
					ast['blocks'] = walk ast['blocks'], state
					ast
				end

				def walk value, state
					case value
					when Array
						value.map { |item| walk item, state }
					when Hash
						case value['t']
						when 'CodeBlock'
							return code_block_to_raw value, state
						when 'Link'
							external_link! value
						end
						value.each_key { |key| value[key] = walk value[key], state }
						value
					else
						value
					end
				end

				def code_block_to_raw code_block, state
					attr, code = code_block['c']
					lang = attr && attr[1] && attr[1].first
					code = code.to_s
					code += "\n" unless code.end_with? "\n"
					lexer = Rouge::Lexer.find_fancy(lang, code, state[:lexer_options]) ||
						Rouge::Lexers::PlainText.new(state[:lexer_options])
					html = if state[:feed]
						"<pre><code>#{Rouge::Formatters::HTML.new.format lexer.lex(code)}</code></pre>"
					else
						format_html get_formatter(lang, state[:formatter]).format(lexer.lex(code))
					end
					{ 't' => 'RawBlock', 'c' => ['html', html] }
				end

				def format_html html
					html.gsub!(%r{<pre class="lineno">(.+?)</pre>}m) { %{<div class="lineno">#{Regexp.last_match 1}</div>} }
					html.gsub! '<pre>', '<pre><code>'
					html.gsub! '</pre>', '</code></pre>'
					html.gsub!(/(<td class="[^"]+ gl")([ >])/) { "#{$1} aria-hidden=\"true\"#{$2}" }
					html
				end

				def get_formatter lang, config
					tag, options, formatter = config.values_at :tag, :options, :formatter
					options = deep_dup options
					if options.is_a? Hash
						options.each_value { |value| value.gsub! '%{lang}', lang.to_s if value.is_a? String }
					end
					formatter_class = Rouge::Formatter.find tag
					formatter_class ||= Rouge::Formatters::HTMLLinewise if tag.to_s == 'html_linewise'
					return formatter_class.new(options || {}) unless formatter
					formatter_class.new get_formatter(lang, formatter), options || {}
				end

				def external_link! link
					contents = link['c']
					return unless contents.is_a?(Array) && contents.length >= 3
					target = contents[2][0].to_s
					return unless target =~ %r{^(https?:)?//}
					attr = contents[0]
					attr[2] ||= []
					set_attr! attr, 'target', '_blank'
					rel = (get_attr(attr, 'rel') || '').split
					rel << 'external' unless rel.include? 'external'
					set_attr! attr, 'rel', rel.join(' ')
				end

				def get_attr attr, key
					pair = attr[2].find { |name, _| name == key }
					pair && pair[1]
				end

				def set_attr! attr, key, value
					pair = attr[2].find { |name, _| name == key }
					if pair
						pair[1] = value
					else
						attr[2] << [key, value]
					end
				end

				def normalize_config config, feed
					config = symbolize_keys config || {}
					config = {
						formatter: deep_dup(config[:formatter] || DEFAULT_CONFIG[:formatter]),
						lexer_options: deep_dup(config[:lexer_options] || DEFAULT_CONFIG[:lexer_options]),
						feed: feed
					}
					config[:formatter] = { tag: 'html' } if feed
					config
				end

				def symbolize_keys value
					case value
					when Hash
						value.each_with_object({}) { |(key, item), result| result[key.to_sym] = symbolize_keys item }
					when Array
						value.map { |item| symbolize_keys item }
					else
						value
					end
				end

				def deep_dup value
					case value
					when Hash
						value.transform_values { |item| deep_dup item }
					when Array
						value.map { |item| deep_dup item }
					when String
						value.dup
					else
						value
					end
				end
			end

			module FeedContentPatch
				module DocumentPatch
					def pandoc_bridge_feed_source= source
						@pandoc_bridge_feed_source = source
						@pandoc_bridge_feed_content = nil
					end

					def pandoc_bridge_feed_source
						@pandoc_bridge_feed_source
					end

					def feed_content
						return content unless pandoc_bridge_feed_source

						@pandoc_bridge_feed_content ||= begin
							converter = site.find_converter_instance Jekyll::Converters::Markdown
							if converter.respond_to? :convert_feed
								converter.convert_feed pandoc_bridge_feed_source
							else
								content
							end
						end
					end
				end

				module RendererPatch
					def convert content
						if document.is_a?(Jekyll::Document) && document.type == :posts && !site.config['no_archive']
							document.pandoc_bridge_feed_source = content.to_s
						end
						super
					end
				end

				module DocumentDropPatch
					def feed_content
						@obj.respond_to?(:feed_content) ? @obj.feed_content : content
					end
				end
			end

			module MarkdownFeedConverterPatch
				def convert_feed content
					setup
					if @parser.respond_to? :convert_feed
						@parser.convert_feed content
					else
						convert content
					end
				end
			end
		end
	end
end

Jekyll::Document.prepend Jekyll::UlyssesZhan::MyMarkdown::FeedContentPatch::DocumentPatch
Jekyll::Renderer.prepend Jekyll::UlyssesZhan::MyMarkdown::FeedContentPatch::RendererPatch
Jekyll::Drops::DocumentDrop.prepend Jekyll::UlyssesZhan::MyMarkdown::FeedContentPatch::DocumentDropPatch
Jekyll::Drops::DocumentDrop.instance_variable_set :@getter_method_names, nil
Jekyll::Converters::Markdown.prepend Jekyll::UlyssesZhan::MyMarkdown::MarkdownFeedConverterPatch

module Jekyll
	module Converters
		class Markdown
			class MyMarkdown
				def initialize config = {}
					@config = config
					@section = deep_stringify_keys config['my_markdown'] || {}
					@haskell_options = build_haskell_options
					@rouge_config = deep_dup @section['rouge'] || {}
					@katex_config = deep_dup @section['katex'] || {}
					@html_rouge_config = @rouge_config
					@feed_rouge_config = feed_rouge_config @rouge_config
					@html_katex_config = katex_config_with_output @katex_config, 'htmlAndMathml'
					@feed_katex_config = katex_config_with_output @katex_config, 'mathml'
				end

				def convert content
					render content, @html_rouge_config, @html_katex_config, false
				end

				def convert_feed content
					render content, @feed_rouge_config, @feed_katex_config, true
				end

				private

				def render content, rouge_config, katex_config, feed
					return content if @config['avoid_markdown']

					packed = Jekyll::UlyssesZhan::MyMarkdown::FFI.markdown_to_ast content.to_s, @haskell_options
					ast = MessagePack.unpack packed
					ast = Jekyll::UlyssesZhan::MyMarkdown::Filter.apply! ast, config: rouge_config, feed: feed
					packed = MessagePack.pack ast
					packed = Jekyll::UlyssesZhan::MyMarkdown::Katex.render packed, katex_config
					Jekyll::UlyssesZhan::MyMarkdown::FFI.ast_to_html(packed, @haskell_options).force_encoding 'UTF-8'
				end

				def build_haskell_options
					options = @section['options'] || {}
					{
						'from' => (options['from'] || 'markdown').to_s,
						'columns' => (options['columns'] || 10000).to_i,
						'tab_stop' => (options['tab_stop'] || 4).to_i,
						'crossref_yaml' => crossref_yaml
					}
				end

				def crossref_yaml
					config = @section['crossref'] || {}
					YAML.dump(camelize_keys(config)).sub(/\A---\n/, '')
				end

				def feed_rouge_config config
					config = deep_dup config
					config['formatter'] = { 'tag' => 'html' }
					config
				end

				def katex_config_with_output config, output
					config = deep_dup config
					config.delete 'output_type'
					config = config.each_with_object({}) { |(key, value), result| result[camelize_key(key)] = value }
					config['output'] = output
					config['throwOnError'] = false
					config
				end

				def camelize_keys value
					case value
					when Hash
						value.each_with_object({}) { |(key, item), result| result[camelize_key(key)] = camelize_keys item }
					when Array
						value.map { |item| camelize_keys item }
					else
						value
					end
				end

				def camelize_key key
					key.to_s.gsub(/_(\w)/) { $1.upcase }
				end

				def deep_stringify_keys value
					case value
					when Hash
						value.each_with_object({}) { |(key, item), result| result[key.to_s] = deep_stringify_keys item }
					when Array
						value.map { |item| deep_stringify_keys item }
					else
						value
					end
				end

				def deep_dup value
					case value
					when Hash
						value.transform_values { |item| deep_dup item }
					when Array
						value.map { |item| deep_dup item }
					when String
						value.dup
					else
						value
					end
				end
			end
		end
	end
end
