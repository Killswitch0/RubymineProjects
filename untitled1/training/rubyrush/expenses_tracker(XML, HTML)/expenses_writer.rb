# Подключаем парсер rexml и библиотеку date для эффективного использования дат
require 'rexml/document'
require 'date'

# Сначала получим текущее содержимое файла. И построим из него XML-структуру в
# переменной doc
current_path = File.dirname(__FILE__ )
file_name = current_path + "/my_expenses.xml"

file = File.new(file_name, "r:UTF-8")

begin
  doc = REXML::Document.new(file)
rescue REXML::ParseException => e
  # Если парсер ошибся при чтении файла, придется закрыть программу.
  puts "Вероятно, что XML файл битый :("
  abort e.message
end

file.close

puts "На что потратили деньги?"
expense_text = STDIN.gets.chomp

puts "Сколько потратили?"
expense_amount = STDIN.gets.chomp.to_i

puts "Укажите дату траты в формате ДД.ММ.ГГГГ, например 10.11.2021 (пустое поле - сегодня)"
date_input = STDIN.gets.chomp

expense_date = nil

if date_input == ''
  # Если пользователь ничего не ввёл, значит он потратил деньги сегодня. Создаем
  # объект класса Date, соответствующий сегодняшнему дню.
  expense_date = Date.today
else
  # Если ввел, попробуем распарсить его ввод
  begin
  expense_date = Date.parse(date_input)
  rescue ArgumentError
    # Если дата введена неправильно, перехватываем исключение и все равно
    # выбираем 'сегодня' с помощью метода today класса Date
    expense_date = Date.today
  end
end

puts "В какую категорию занести трату?"
expense_category = STDIN.gets.chomp

# Добавим трату в нашу XML-структуру в переменной doc

# Для этого найдём элемент expenses (корневой)
expenses = doc.elements.find('expenses').first

# И добавим элемент командой add_element. Все аттрибуты пропишем с помощью
# параметра, передаваемого в виде ассоциативного массива
expense = expenses.add_element('expense', {
  'date' => expense_date.to_s,
  'category' => expense_category,
  'amount' => expense_amount
})

# А содержимое элемента меняется вызовом метода-сеттера text=
expense.text = expense_text

# Осталось только записать новую XML-структуру в файл методов write. В качестве
# параметра методу передаётся указатель на файл. Красиво отформатируем текст в
# файлике с отступами в два пробела.
file = File.new(file_name, "w:UTF-8")
doc.write(file, 2)
file.close

puts "Запись успешно сохранена"