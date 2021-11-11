require 'rexml/document'
require 'date'

require_relative 'lib/wish.rb'

file_path = File.dirname(__FILE__ ) + "/wishes.xml"

abort "#{file_path} не найден" unless File.exist?(file_path)

file = File.new(file_path, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

wishes = []
doc.elements.each("wishes/wish") do |wish_node|
  wishes << Wish.new(wish_node)
end

puts "Желания, которые должны были сбыться к сегодняшнему дню"
wishes.each { |wish| puts wish if wish.overdue?}








