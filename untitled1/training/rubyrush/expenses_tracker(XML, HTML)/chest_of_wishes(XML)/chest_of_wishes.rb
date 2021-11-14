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

# Теперь мы можем быть уверены, что файл на диске в нужном месте точно есть. Если
# он был — хорошо, если нет — мы его создали, без данных, но с нужной нам
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

puts "Запись успешно сохранена в сундук :)"

#
#
#
#
#
# !!!!!!!!! В ДАННОМ КОДЕ СОДЕРЖИТСЯ РЕАЛИЗАЦИЯ СПИСКА ЖЕЛАНИЙ !!!!!!!!!
# на 2 категори, и последовательный их вывод: которые сбудутся; которым предстоит сбыться.
#
# Создадим переменную с текущей датой
time_today = Date.today

# В двух переменных мы создадим два массива, в которые будет сортировать желания:
# сбывшиеся/не сбывшиеся
come_true_wishes = []
lost_wishes = []

# Выбираем из элементов документа все тэги <wish> внутри тега <wishes> и в
# цикле проходимся по ним.
doc.elements.each("wishes/wish") do |item|

  # В локальную переменную date_of_wish запишем дату исполнения желания: Date.parse создает из
  # строки объект класса Date.
  date_of_wish = Date.parse(item.attributes["date"])

  # Метод strftime("%d.%m.%Y") вернет нам дату в формате ДД.ММ.ГГГГ
  date_of_wish.strftime("%d.%m.%Y")

  # в current_wish поместим текст желания. Метод text в предоставляет нам текст,
  # находищийся внутри тэга <wish>
  current_wish = item.text

  # В данном условии мы проверяем: если дата исполнения
  # загаданного желания <= сегодняшней дате, то в массив come_true_wishes << текст желания current_wish.strip
  # метод strip в конце удаляет любые невидимые символы переноса строки, отступы и т.п.
  if date_of_wish <= time_today
    come_true_wishes << current_wish.strip
  else
    # В противном случае текст желания добавляется в массив lost_wishes
    lost_wishes << current_wish.strip
  end
end


puts "\n________________________________\n"
puts "Желания, которые успели сбыться:"

# Переменная, куда будет добавлятся число 1 после каждой итерации цикла
index = 1
# В цикле проходимся по всем элементам массива come_true_wishes
come_true_wishes.each do |wish|
  puts "#{index}: #{wish}" # последовательно выводим список желаний, благодаря переменной index

  index += 1 # с каждой итерацией увеличиваем переменную index
end

puts "\n___________________________\n"
puts "Желания, которые сбудуться:"

# Аналогичная ситуация
index = 1

lost_wishes.each do |wish|
  puts "#{index}: #{wish}"

  index += 1
end

