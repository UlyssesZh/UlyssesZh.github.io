# frozen_string_literal: true

require 'rqrcode'

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::Tags
		class QedTag < Liquid::Tag
			def self.tag_name
				'qed'
			end

			def initialize tag_name, text, tokens
				super
				@type = :normal
				%i[last span].each { @type = _1 if text =~ /#{_1}/i }
				# normal: float right
				# last: float right in the last line
				# span: create a dedicated line
			end

			def render context
				%{<span class="qed-wrapper qed-#@type"><span class="qed qed-#@type">$\\square$</span></span>}
			end
		end

		class CopyTag < Liquid::Tag
			def self.tag_name
				'copy'
			end

			def render context
				'<sup>&copy;</sup>'
			end
		end

		class QrCodeTag < Liquid::Tag
			def self.tag_name
				'qrcode'
			end

			def initialize tag_name, text, tokens
				super
				@title, @text = text.match(/(.*)\s+(\S+)/)[1..]
			end

			def render context
				<<~RESULT
					<figure>
					#{RQRCode::QRCode.new(@text).as_svg(
						color: :currentColor,
						module_size: 8,
						use_path: true
					)}
					<figcaption><a href="#{@text}" rel="external">#{@title}</a></figcaption>
					</figure>
				RESULT
			end
		end

		constants.each do |c|
			tag_class = const_get c
			next unless tag_class.respond_to? :tag_name
			tag_name = tag_class.tag_name
			Liquid::Template.register_tag tag_name, tag_class
		end
	end
end
