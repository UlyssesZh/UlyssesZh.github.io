# frozen_string_literal: true

require 'highline/import'

task default: :serve

task :serve do
	sh 'bundle exec jekyll serve --host 0.0.0.0 --port 3999 --verbose --trace --livereload --livereload-port 35730'
end

task :serve_i do
	sh 'JEKYLL_AVOID_MARKDOWN=1 JEKYLL_NO_ARCHIVE=1 bundle exec jekyll serve --host 0.0.0.0 --port 3999 --incremental --verbose --trace --livereload --livereload-port 35730'
end

def which cmd
	exts = ENV['PATHEXT']&.split(';') || ['']
	ENV['PATH'].split(File::PATH_SEPARATOR).each do |path|
		exts.each do |ext|
			exe = File.join path, "#{cmd}#{ext}"
			return exe if File.executable?(exe) && !File.directory?(exe)
		end
	end
	nil
end

PANDOC_INSTALL_COMMAND = 'cabal v2-install pandoc-cli'
PANDOC_CROSSREF_INSTALL_COMMAND = 'cabal v2-install pandoc-crossref'
PANDOC_KATEX_INSTALL_COMMAND = 'cargo install pandoc-katex'

task :prepare do
	pandoc_version = 2.times do |i|
		if which 'pandoc'
			version_output = `pandoc --version`
			/pandoc (?<pandoc_version>(\d+\.)+\d+)/ =~ version_output
			puts "Pandoc found: #{pandoc_version}"
			#/(?<lua>.)lua/ =~ version_output
			#if lua == '-'
			#	puts 'This version of pandoc does not support Lua filters.'
			#else
				break pandoc_version
			#end
		else
			puts '`pandoc` command not found.'
		end
		if i == 0
			if agree "Install using `#{PANDOC_INSTALL_COMMAND}`?"
				sh PANDOC_INSTALL_COMMAND
			else
				abort 'Aborted.'
			end
		else
			abort "Failed to properly install Pandoc."
		end
	end

	pandoc_crossref_version, target_pandoc_version = 2.times do |i|
		if which 'pandoc-crossref'
			/pandoc-crossref v(?<pandoc_crossref_version>(\d+\.)+\d+) .* Pandoc v(?<target_pandoc_version>(\d+\.)+\d+)/ =~ `pandoc-crossref --version`
			puts "pandoc-crossref found: #{pandoc_crossref_version}"
			break pandoc_crossref_version, target_pandoc_version
		elsif i == 0
			if agree "`pandoc-crossref` command not found. Install using `#{PANDOC_CROSSREF_INSTALL_COMMAND}`?"
				sh PANDOC_CROSSREF_INSTALL_COMMAND
			else
				abort 'Aborted.'
			end
		else
			abort "`pandoc-crossref` command still not found after trying to install. You need to install it manually."
		end
	end

	if pandoc_version != target_pandoc_version
		abort "Pandoc version mismatch: #{pandoc_version} != #{target_pandoc_version}."
	end

	pandoc_katex_version, katex_version = 2.times do |i|
		if which 'pandoc-katex'
			version_output = `pandoc-katex --version`
			/^pandoc-katex (?<pandoc_katex_version>(\d+\.)+\d+)/ =~ version_output
			/^katex (?<katex_version>(\d+\.)+\d+)/ =~ version_output
			puts "pandoc-katex found: #{pandoc_katex_version}"
			break pandoc_katex_version, katex_version
		elsif i == 0
			if agree "`pandoc-katex` command not found. Install using `#{PANDOC_KATEX_INSTALL_COMMAND}`?"
				sh PANDOC_KATEX_INSTALL_COMMAND
			else
				abort 'Aborted.'
			end
		else
			abort "`pandoc-katex` command still not found after trying to install. You need to install it manually."
		end
	end
end
