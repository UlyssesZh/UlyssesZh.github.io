# frozen_string_literal: true

require 'jekyll-archives'

module Jekyll
	class ArchivesPageGenerator < Generator
		safe true
		priority :low
		def generate site
			archives = site.config['archives']
			structure = {}
			archives.each do |archive|
				dir = URL.unescape_path(archive.url).gsub /^\//, ''
				current = structure
				dir.split(?/).tap(&:shift).each do |subdir|
					current = current[subdir] ||= {}
				end
				current['index.html'] = 'f'
			end
			site.pages.push ArchivesPage.new site, structure
		end
	end
	class ArchivesPage < Page
		def initialize site, archives
			@site = site
			@base = site.source
			@dir = 'my_pages'
			@name = 'archives.html'
			process @name
			@data = {
					'layout'    => 'my_page',
					'title'     => 'Archives',
					'permalink' => '/archives/'
			}
			@content = build_archives '/archives', archives, 1
		end
		def build_archives path, archives, indent
			return '' if archives == { 'index.html' => 'f' }
			
			newline = ?\n + ?\t * indent
			result = '<ul>' + newline
			archives.keys.sort.each do |key|
				next if key == 'index.html'
				
				result += '<li>'
				subpath = File.join path, key
				child_title = key.tr ?-, ?\s
				if archives[key]['index.html']
					child_title = "<a href=\"#{subpath}/\">#{child_title}</a>"
				end
				result += child_title
				result += build_archives subpath, archives[key], indent + 1
				result += '</li>' + newline
			end
			result + '</ul>'
		end
	end
end
