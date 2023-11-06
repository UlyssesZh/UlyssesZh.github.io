# frozen_string_literal: true

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::ScssFunctions

		ASSET_PATHS = [
		]
		Converters::Scss.prepend self
		
		def sass_configs
			{
				**super,
				functions: {
					'asset-path($path)' => method(:asset_path)
				}
			}
		end

		def asset_path args
			path = args.first.text
			ASSET_PATHS.each do |dir|
				if File.exist? File.join site_source, dir, path
					return Sass::Value::String.new File.join dir, path
				end
			end
			Sass::Value::String.new path
		end
	end
end
