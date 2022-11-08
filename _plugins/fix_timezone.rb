# Fuck time zones. I hope in one day the world will use UTC everywhere.
# See: https://github.com/jekyll/jekyll/issues/6033
module Jekyll::Utils
	def parse_date input, msg = "Input could not be parsed."
		Time.parse input
	rescue ArgumentError
		raise ::Jekyll::Errors::InvalidDateError, "Invalid date '#{input}': #{msg}"
	end
end
