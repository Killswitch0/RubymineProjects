# Как всегда подключаем парсер и библиотеку для работы с датами
require 'rexml/document'
require 'date'

# Наш сундук будет по адресу data/chest.xml, запишем путь к нему в переменную
# file_path
current_path = File.dirname(__FILE__ )
file_name = current_path + "/wishes.xml"

# Если файл с сундуком не найден, его надо создать
unless File.exist?(file_name)
  # Тут мы воспользуемся ещё одним удобным интерфейсом класса File — методом
  # open, которому можно передать блок с инструкциями для работы с объектом
  # класса File. Тогда нам не придется закрывать файл вручную, т.к. сразу после
  # выполнения действий в блоке файл будет закрыт.
  File.open(file_name, "w:UTF-8") do |file|
    # Добавим в документ служебную строку с версией и кодировкой и пустой тег
    file.puts "<?xml version='1.0' encoding='UTF-8'?>"
    file.puts "<wishes></wishes>"
  end
end

# Теперь мы можем быть уверены, что файл на диске внужном месте точно есть. Если
# он был — хорошо, если нет — мы его создали, без данных но с нужной нам
# структурой. В любом случае считываем из него содержимое и строим из него
# структуру XML с помощью нашего любимого парсера REXML
file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

# Спрашиваем у пользователя желание, которое он хочет загадать
puts "Какое желание вы хотели бы загадать?"
wish_text = STDIN.gets.chomp

# Дату, до которой желание должно исполниться
puts "До какой даты вы хотели бы его реализовать?"
deadline = STDIN.gets.chomp
wish_date = Date.parse(deadline)

# Добавим к корневому элементу нашей XML-структуры ещё один тег wish и добавим
# к нему аттрибут date  со строкой даты в нужном формате
wish = doc.root.add_element 'wish', {
  'date' => wish_date.strftime("%d.%m.%Y")
}

# Добавим текст желания к тексту элемента с пом. метода text
wish.text = wish_text

#Снова откроем файл, но уже на запись и запишем туда все данные в нужном
# формате
file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

file = File.new(file_name, "r:UTF-8")
doc = REXML::Document.new(file)


time_today = Date.today

true_wishes = []
false_wishes = []


doc.elements.each("wishes/wish") do |item|
  date_of_wish = Date.parse(item.attributes["date"])
  date_of_wish.strftime("%d.%m.%Y")

  current_wish = item.text

  if date_of_wish <= time_today
    true_wishes << current_wish.strip
  else
     false_wishes << current_wish.strip
  end
end

puts "Запись успешно сохранена в сундук :)"

index = 1

puts "Желания, которые успели сбыться:"
true_wishes.each do |wish|
  puts "#{index}: #{wish}"
  index += 1
end

puts

index = 1
puts "Желания, которые сбудуться:"
false_wishes.each do |wish|
  puts "#{index}: #{wish}"
  index += 1
end

