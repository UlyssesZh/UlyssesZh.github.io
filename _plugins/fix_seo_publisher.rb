module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::SeoJSONLDDropPatch
		SeoTag::JSONLDDrop.prepend self
		def publisher
			super&.tap { _1["@type"] = "Person" }
		end
	end
end
