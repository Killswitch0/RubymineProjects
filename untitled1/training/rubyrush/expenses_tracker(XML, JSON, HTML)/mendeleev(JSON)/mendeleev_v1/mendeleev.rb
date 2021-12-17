# Подключаем библиотеку JSON
require 'json'

# Прочитаем файл в ассоциативный массив
file = File.read('table.json', encoding: "UTF-8")
table = JSON.parse(file)

# Выведем список элементов
puts "У нас есть #{table['table'].keys.size} элементов:
***"
puts table['table'].keys.join(", ")

# Спросим у пользователя, о каком элементе он хочет узнать
puts "***\nО каком элементе хотите узнать?"
element = STDIN.gets.chomp

# Если такой элемент есть в нашем хэше - выводим онформацию о нем
if table['table'].key?(element)
  puts "Первооткрыватель элемента #{table['table'][element]}"
else
  puts "Извините, такого элемента нет"
end