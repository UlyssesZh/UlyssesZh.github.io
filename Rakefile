require 'fileutils'

ROOT = __dir__
PANDOC_DIR = File.join ROOT, '_lib/pandoc-bridge'
PANDOC_LIB = File.join PANDOC_DIR, 'libpandoc_bridge.so'
KATEX_DIR = File.join ROOT, '_lib/katex-bridge'
KATEX_BUNDLE = File.join KATEX_DIR, 'dist/katex-bridge.js'
PANDOC_FREEZE = File.join PANDOC_DIR, 'cabal.project.freeze'

# packages that GHC ships, must never be pinned in the freeze file
# https://github.com/haskell/cabal/blob/cabal-install-v3.18.2.0/cabal-install/src/Distribution/Client/Dependency.hs#L493-L503
NON_REINSTALLABLE_PACKAGES = %w[
	base
	ghc
	ghc-bignum
	ghc-internal
	ghc-prim
	integer-gmp
	integer-simple
	template-haskell
].freeze

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

def prune_non_reinstallable_constraints(path)
	lines = File.readlines path
	start = lines.index { _1.start_with? 'constraints:' }
	raise "no constraints field in #{path}" unless start
	stop = (start + 1...lines.length).find { lines[_1].match? /\A\S/ } || lines.length
	body = lines[start...stop].join.sub(/\Aconstraints:\s*/, '')
	kept = body.split(',').map(&:strip).reject(&:empty?).reject do |constraint|
		name = constraint.split.first.delete_prefix('any.').split(':').first
		NON_REINSTALLABLE_PACKAGES.include? name
	end
	raise "all constraints in #{path} are non-reinstallable" if kept.empty?
	indent = ' ' * 'constraints: '.length
	section = kept.each_with_index.map do |constraint, i|
		"#{i.zero? ? 'constraints: ' : indent}#{constraint}#{i == kept.length - 1 ? '' : ','}\n"
	end
	File.write path, (lines[...start] + section + lines[stop..]).join
end

task :default => :build

task :serve => :build_libs do
	sh 'jekyll serve --host 0.0.0.0 --port 3999 --verbose --trace --livereload --livereload-port 35730'
end

task :serve_i => :build_libs do
	%w[AVOID_MARKDOWN NO_ARCHIVE NO_FEED NO_POST_NAV].each { ENV["JEKYLL_#{_1}"] = ?1 }
	sh 'jekyll serve --host 0.0.0.0 --port 3999 --incremental --verbose --trace --livereload --livereload-port 35730'
end

task :build => :build_libs do
	ENV['JEKYLL_ENV'] = 'production'
	sh 'jekyll build --verbose --trace'
end

task :mdl do
	sh 'mdl _posts README.md'
end

task :update => [:update_gems, :update_pandoc, :update_katex]

task :update_gems do
	sh 'bundle update --bundler'
	sh 'bundle update --all'
end

task :update_pandoc do
	Dir.chdir PANDOC_DIR do
		sh 'cabal update'
		FileUtils.rm_f 'cabal.project.freeze'
		sh 'cabal freeze'
	end
	prune_non_reinstallable_constraints PANDOC_FREEZE
end

task :update_katex do
	Dir.chdir KATEX_DIR do
		sh 'npm update --no-audit --no-fund'
	end
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
