# frozen_string_literal: true

return if ENV['JEKYLL_NO_ARCHIVE']

module Jekyll::UlyssesZhan
end

module Jekyll

	module UlyssesZhan::ArchivePatch
		Archives::Archive.prepend self

		def initialize *args
			super
			@title = case @type
			when 'year', 'month', 'day'
				date.strftime @config['titles'][@type]
			when 'category', 'tag'
				@config['titles'][@type] % @title
			else
				@title
			end
		end
	end

	module UlyssesZhan::ArchivesPatch
		Archives::Archives.prepend self

		DEFAULTS = {
			**Archives::Archives::DEFAULTS,
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
