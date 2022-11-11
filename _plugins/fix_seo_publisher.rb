# frozen_string_literal: true

class Jekyll::SeoTag::JSONLDDrop
	def publisher
		return unless logo
		output = {
			"@type" => "Person", # modified
			"logo"  => {
				"@type" => "ImageObject",
				"url"   => logo,
			},
		}
		output["name"] = page_drop.author.name if page_drop.author.name
		output
	end
end
