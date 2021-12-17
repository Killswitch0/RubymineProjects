# Подключаем библиотеку json
require 'json'

# Прочитаем файл в ассоциативный массив
file = File.read('table.json', encoding: "UTF-8")
table = JSON.parse(file)

# Выведем список элементов
puts "У нас есть #{table.keys.size} элементов:
***"
puts table['table'].keys

# Спросим пользователя о нем
puts "***\nО каком элементе хотите узнать?"
user_element = STDIN.gets.chomp

# Если такой элемент есть в нашем хэше - выводим информацию о нем
# в цикле вы выводим каждый элемент в паре ключ-значение
if table['table'].key?(user_element)
  table['table'][user_element].each do |key, el|
    puts "#{key}: #{el}"
  end
else
  puts "Такого элемента нет"
end