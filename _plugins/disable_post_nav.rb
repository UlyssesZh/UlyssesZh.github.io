# post navigation through `page.previous` and `page.next` make every post dependent on each other
# so every post is regenerated when one post gets changed in incremental build
# use patches to disable this dependency propagation

return unless ENV['JEKYLL_NO_POST_NAV']

module Jekyll::UlyssesZhan
end

module Jekyll
	module UlyssesZhan::DocumentDisablePreviousNextPatches
		Document.prepend self

		def previous_doc
			nil
		end

		def next_doc
			nil
		end
	end
end
