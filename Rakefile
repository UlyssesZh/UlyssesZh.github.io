require 'fileutils'

ROOT = __dir__
HASKELL_DIR = File.join ROOT, '_lib/pandoc-bridge'
HASKELL_LIB = File.join HASKELL_DIR, 'libpandoc_bridge.so'
KATEX_DIR = File.join ROOT, '_lib/katex-bridge'
KATEX_BUNDLE = File.join KATEX_DIR, 'dist/katex-bridge.js'

HASKELL_SOURCES = FileList[
	File.join(HASKELL_DIR, '*.cabal'),
	File.join(HASKELL_DIR, 'cabal.project'),
	File.join(HASKELL_DIR, 'src/**/*.hs')
]
KATEX_SOURCES = FileList[
	File.join(KATEX_DIR, 'package.json'),
	File.join(KATEX_DIR, 'package-lock.json'),
	File.join(KATEX_DIR, 'src/**/*.js')
]

task :default => :serve

desc 'Build the native/JS libraries and serve the site locally'
task :serve => :build_libs do
	sh 'jekyll serve --host 0.0.0.0 --port 3999 --verbose --trace --livereload --livereload-port 35730'
end

desc 'Build the native/JS libraries and serve with incremental, limited features'
task :serve_i => :build_libs do
	sh 'JEKYLL_AVOID_MARKDOWN=1 JEKYLL_NO_ARCHIVE=1 jekyll serve --host 0.0.0.0 --port 3999 --incremental --verbose --trace --livereload --livereload-port 35730'
end

desc 'Run markdownlint on posts and README'
task :mdl do
	sh 'mdl _posts README.md'
end

desc 'Build the Haskell pandoc-bridge and the JavaScript katex-bridge'
task :build_libs => [:build_haskell, :build_katex]

desc 'Alias for build_libs'
task :build => :build_libs

desc 'Build the Haskell pandoc-bridge shared library'
task :build_haskell => HASKELL_LIB

file HASKELL_LIB => HASKELL_SOURCES do
	Dir.chdir HASKELL_DIR do
		sh 'cabal v2-build flib:pandoc_bridge --enable-shared'
		built = `cabal list-bin flib:pandoc_bridge --enable-shared`.strip
		raise 'cabal did not produce the pandoc_bridge foreign library' if built.empty?
		cp built, HASKELL_LIB
	end
end

desc 'Build the bundled KaTeX/MessagePack JavaScript bridge'
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
