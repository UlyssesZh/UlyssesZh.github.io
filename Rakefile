require 'fileutils'

ROOT = __dir__
PANDOC_DIR = File.join ROOT, '_lib/pandoc-bridge'
PANDOC_LIB = File.join PANDOC_DIR, 'libpandoc_bridge.so'
KATEX_DIR = File.join ROOT, '_lib/katex-bridge'
KATEX_BUNDLE = File.join KATEX_DIR, 'dist/katex-bridge.js'

PANDOC_SOURCES = FileList[
	File.join(PANDOC_DIR, '*.cabal'),
	File.join(PANDOC_DIR, 'cabal.project*'),
	File.join(PANDOC_DIR, 'src/**/*.hs')
]
KATEX_SOURCES = FileList[
	File.join(KATEX_DIR, 'package.json'),
	File.join(KATEX_DIR, 'package-lock.json'),
	File.join(KATEX_DIR, 'src/**/*.js')
]

task :default => :build

task :serve => :build_libs do
	sh 'jekyll serve --host 0.0.0.0 --port 3999 --verbose --trace --livereload --livereload-port 35730'
end

task :serve_i => :build_libs do
	sh 'JEKYLL_AVOID_MARKDOWN=1 JEKYLL_NO_ARCHIVE=1 jekyll serve --host 0.0.0.0 --port 3999 --incremental --verbose --trace --livereload --livereload-port 35730'
end

task :build => :build_libs do
	sh 'JEKYLL_ENV=production jekyll build --verbose --trace'
end

task :mdl do
	sh 'mdl _posts README.md'
end

task :build_libs => [:build_pandoc, :build_katex]

task :build_pandoc => PANDOC_LIB
file PANDOC_LIB => PANDOC_SOURCES do
	Dir.chdir PANDOC_DIR do
		sh 'cabal v2-build flib:pandoc_bridge --enable-shared'
		built = `cabal list-bin flib:pandoc_bridge --enable-shared`.strip
		raise 'cabal did not produce the pandoc_bridge foreign library' if built.empty?
		cp built, PANDOC_LIB
	end
end

task :build_katex => KATEX_BUNDLE
file KATEX_BUNDLE => KATEX_SOURCES do
	Dir.chdir KATEX_DIR do
		if File.file?('package-lock.json')
			sh 'npm ci --no-audit --no-fund'
		else
			sh 'npm install --no-audit --no-fund'
		end
		sh 'npm run build'
	end
end
