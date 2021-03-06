# Ассоциативный массив, где имени элемента соотвутствует фамилия его первооткрывателя
table = {
  "H" => "Кавендиш",
  "He" => "Локьер",
  "Li" => "Арфведсон",
  "Be" => "Воклен",
  "B" => "Дэви и Гей-Люссак"
}

# Выводим кол-во имеющихся в наличии элементов
puts "У нас есть #{table.keys.size} элементов:
***"

# Выводим непосредственно сами элементы
puts table.keys

# Спрашиваем у пользователя, какой элемент его интересует и записываем его
# выбор в переменную element.
puts "***\nО каком элементе хотите узнать?"
element = gets.chomp

# Проверка - есть ли в хэше элемент, о котором спросил пользователь
if table.key?(element)
  puts "Первооткрыватель элемента: #{table[element]}"
else
  puts "Извините, мы не знаем такого элемента"
end