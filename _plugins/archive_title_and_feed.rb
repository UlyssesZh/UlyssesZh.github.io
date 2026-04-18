return if ENV['JEKYLL_NO_ARCHIVE']

module Jekyll::UlyssesZhan
end

module Jekyll

	module UlyssesZhan::ArchivePatch
		Archives::Archive.prepend self

		def initialize *args
			super
			@feed = case @type
			when 'category'
				"/feed/#@title.xml"
			when 'tag'
				"#{@site.config.dig('feed', 'tags', 'path') || '/feed/by_tag/'}#@title.xml"
			end
			@title = case @type
			when 'year', 'month', 'day'
				date.strftime @config['titles'][@type]
			when 'category', 'tag'
				@config['titles'][@type] % @title
			else
				@title
			end
			@data['feed'] = @feed # I have no idea why this is needed
		end

		attr_reader :feed
	end

	Archives::Archive::ATTRIBUTES_FOR_LIQUID = [
		*Archives::Archive::ATTRIBUTES_FOR_LIQUID,
		'feed'
	].freeze
	Archives::PageDrop.def_delegators :@obj, :feed

	Archives::Archives::DEFAULTS = {
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
