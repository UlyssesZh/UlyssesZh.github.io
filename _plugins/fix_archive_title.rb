# frozen_string_literal: true

module Jekyll::Archives
	class Archive < ::Jekyll::Page # monkey-patching
		def title
			case @type
			when 'year', 'month', 'day'
				date.strftime @config['titles'][@type]
			when 'category', 'tag'
				@config['titles'][@type] % @title
			else
				@title
			end
		end
	end
	class Archives < ::Jekyll::Generator # monkey-patching
		::Jekyll::UlyssesZhan.silence_warnings do
			DEFAULTS = {
				**DEFAULTS,
				"titles" => {
					"year" => "",
					"month" => "",
					"day" => "",
					"category" => "%s",
					"tag" => "%s"
				}
			}.freeze
		end
	end
end
