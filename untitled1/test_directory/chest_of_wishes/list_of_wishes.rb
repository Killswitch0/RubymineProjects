require 'rexml/document'
require 'date'

require_relative 'lib/wish.rb'

file_path = File.dirname(__FILE__ ) + "/wishes.xml"

file = File.new(file_path, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

wishes = []

doc.elements.each("wishes/wish") do |wish_node|
  wishes << Wish.new(wish_node)
end

puts "Желания, которые исполнились"
wishes.each { |wish| puts wish if wish.overdue? }

puts

puts "Желания, которым предстоит исполниться"
wishes.each { |wish| puts wish unless wish.overdue? }