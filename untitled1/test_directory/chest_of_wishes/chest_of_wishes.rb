require 'rexml/document'
require 'date'

file_path = File.dirname(__FILE__ ) + "/wishes.xml"

unless File.exist?(file_path)
  File.open(file_path, "w:UTF-8") do |file|
    file.puts "<?xml version='1.0' encoding='UTF-8'?>"
    file.puts "<wishes></wishes>"
  end
end

file = File.new(file_path, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

puts "Какое желание хотите загадать?"
wish_text = STDIN.gets.chomp

puts "До какого числа желание должно исполниться?"
deadline = STDIN.gets.chomp

if deadline == ''
  wish_date = Date.today
else
  wish_date = Date.parse(deadline)
end

wish = doc.root.add_element 'wish', {
  'date' => wish_date.strftime("%d.%m.%Y")
}

wish.text = wish_text

file = File.new(file_path, "w:UTF-8")
doc.write(file, 2)
file.close

puts "Запись успешно сохранена :)"



