# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require "open-uri"

id = 0
e_content = ""
v_content = ""

open("http://dl.dropbox.com/u/89535693/file_14.txt") do |line|
	line.read.each_line do |l|
		if l =~ /\ID#\d+/
			id = l.sub(/\ID#/,"")
	 		puts id
	 	else
	 		l.scan(/(?<=<E>)[\w*\D\s.]*(?=<\/E>)/) { 
	 			|e_match|  e_content = e_match
	 		}
	 		l.scan(/(?<=<V>)[\w*\D\s.]*(?=<\/V>)/) { 
	 			|v_match|  v_content = v_match
	 			Script.create!(:e_content => e_content,:script_number => id, :v_content => v_content)
	 		}
		end
	end
end