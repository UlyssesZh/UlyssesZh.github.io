module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::PaginationPagePatch
		PaginateV2::Generator::PaginationPage.prepend self

		def initialize page_to_copy, cur_page_nr, total_pages, index_pageandext
			@page_to_copy = page_to_copy
			super
		end

		def relative_path
			@url
		end

	end
end
