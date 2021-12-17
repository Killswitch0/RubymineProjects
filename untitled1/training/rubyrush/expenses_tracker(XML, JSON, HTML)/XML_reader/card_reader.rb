require 'rexml/document'

file_name = File.dirname(__FILE__ ) + "/business_card.xml"

unless File.exist?(file_name)
  abort "Прошу прощения, Господин, файл #{file_name} не найден"
end

# Открываем файл и создаём из его содержимого REXML-объект
file = File.new(file_name)
doc = REXML::Document.new(file)
file.close

# Теперь мы можем достать любое поле нашей визитки с помощью методов объекта doc
# Например, doc.root.elements["first_name"].text
# Давайте запишем все поля в ассоциативный массив

card = {}

# Обратите внимание, что ключами в нашем массиве будут не метки (как обычно), а строки
['first_name', 'second_name', 'last_name', 'phone', 'email', 'skills'].each do |field|
  card[field] = doc.root.elements[field].text
end

# Наконец, выведем визитку в консоль
puts "#{card['first_name']} #{card['second_name']} #{card['last_name']}"
puts "#{card['phone']}, #{card['email']}"
puts "#{card['skills']}"










