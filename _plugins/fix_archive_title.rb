# frozen_string_literal: true

module Jekyll::UlyssesZhan
end

module Jekyll::UlyssesZhan::Utils
	module_function
	def silence_warnings
		warn_level = $VERBOSE
		$VERBOSE = nil
		result = yield
		$VERBOSE = warn_level
		result
	end
end

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
		::Jekyll::UlyssesZhan::Utils.silence_warnings do
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
