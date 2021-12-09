require 'rexml/document'
require 'date'

puts "На что потратили деньги?"
expense_text = STDIN.gets.chomp

puts "Сколько потратили?"
expense_amount = STDIN.gets.chomp.to_i

puts "Укажите дату траты в формате ГГГГ.ММ.ДД, например 20.02.2021(пустое поле - значит сегодня)"
date_input = STDIN.gets.chomp

expense_date = nil

if date_input == ''
  expense_date = Date.now
else
  expense_date = Date.parse(date_input)
end

puts "В какую категорию занести трату?"
expense_category = STDIN.gets.chomp

file_path = File.dirname(__FILE__ ) + "/my_expenses.xml"

file = File.new(file_path, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

expenses = doc.elements.find("expenses").first

expense = expenses.add_element 'expense', {
  'amount' => expense_amount,
  'category' => expense_category,
  'date' => expense_date.to_s
}

expense.text = expense_text

file = File.new(file_path, "w:UTF-8")
doc.write(file, 2)

puts "Запись успешно сохранена :)"
