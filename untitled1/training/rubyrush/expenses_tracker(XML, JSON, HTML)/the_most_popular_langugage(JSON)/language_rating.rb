# Подключаем библиотеку json
require 'json'

# Читаем JSON-файл в ассоциативном массиве
file = File.read('languages.json', encoding: 'UTF-8')
languages = JSON.parse(file)

# Для ассоциативных массивов, как и для обычных, тоже есть метод sort_by, он кладет
# в переменные блока по очереди каждую пару ключ-значение.
# метод sort_by возвращает массив
lang_rating = languages['languages'].sort_by { |key, score| score }


# Переворачиваем массив .reverse и выдергивает первый элемент .first
# поскольку наш хэщ-массив теперь выглядит так ["Python", 100],
# мы можем дернуть у него первый и последний элемент - .first или .last
most_popular = lang_rating.reverse.first
puts "[ Самый популярный язык #{most_popular.first}: #{most_popular.last} ]"
puts

# Переворачиваем отсортированный массив в порядке убывания,
# выводим пару ключ-значение каждого элемента
lang_rating.reverse.each do |key, score|
  puts "#{key}: #{score}"
end







