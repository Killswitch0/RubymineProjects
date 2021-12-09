require 'rexml/document'

file_path = File.dirname(__FILE__ ) + "/business_card.xml"

abort "Файл #{file_path} не найден" unless File.exist?(file_path)

file = File.new(file_path, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

card = {}

['name', 'last_name', 'skills', 'number', 'email', 'photo'].each do |field|
  card[field] = doc.root.elements[field].text
end

html = REXML::Document.new

html.add_element('html', {'lang' => 'ru'})

html.root.add_element('head').add_element('meta', 'charset' => 'UTF-8')


body = html.root.add_element('body')

body.add_element('p').add_element('img', 'src' => card['photo'])


h1 = body.add_element('h1').add_text("#{card['name']} #{card['last_name']}")


body.add_element('p').add_text("#{card['skills']}")
body.add_element('p').add_text("#{card['email']}")
body.add_element('p').add_text("#{card['number']}")

html_file_path = File.dirname(__FILE__ ) + "/business_card.html"

file = File.new(html_file_path, "w:UTF-8")

file.puts('<!DOCTYPE HTML>')

html.write(file, 2)
file.close




