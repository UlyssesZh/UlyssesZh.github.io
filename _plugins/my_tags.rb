# frozen_string_literal: true

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::Tags
		class QedTag < Liquid::Tag
			def self.tag_name
				'qed'
			end

			def render context
				'<span class="qed">$\square$</span>'
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
