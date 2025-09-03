require 'json'

module Jekyll::UlyssesZhan
end

module Jekyll
	class UlyssesZhan::RPGMapGenerator < Generator
		RPG_DIR = 'rpg'
		safe true
		def generate site
			old_pwd = Dir.pwd
			Dir.chdir RPG_DIR
			site.config['rpg-map']['enabled'].each do |dist|
				result = { dist => {} }
				build result[dist], Dir.new(dist)
				site.pages.push UlyssesZhan::RPGMapJSON.new site, dist, result
			end
			Dir.chdir old_pwd
		end
		def build hash, dir
			dir.each_child do |child|
				if Dir.exist? file_name = "#{dir.path}/#{child}"
					build hash[child] = {}, Dir.new(file_name)
				else
					hash[child] = 'f'
				end
			end
		end
	end
	class UlyssesZhan::RPGMapJSON < Page
		def initialize site, dist, hash
			@site = site
			@base = site.source
			@dir = File.join UlyssesZhan::RPGMapGenerator::RPG_DIR, dist
			@name = 'map.json'
			process @name
			@data = {}
			@content = JSON.generate hash
		end
	end
end
