module Jekyll::UlyssesZhan
	module_function
	def silence_warnings
		warn_level = $VERBOSE
		$VERBOSE = nil
		result = yield
		$VERBOSE = warn_level
		result
	end
end
