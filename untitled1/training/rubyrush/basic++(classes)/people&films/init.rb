#Подключаем классы Film и Person
require_relative 'film'
require_relative 'person'

# Создаем экземпляр класса - это наш человек
person = Person.new("Сергей", "Иванович")

#Присваиваем данному объекту экземпляр класса Film, который будет храниться в переменной
# класса Person, название которой @lovely_film
person.film = Film.new("Челюсти", "какой-то режиссер")


person.full_name
puts "с любимым фильмом: #{person.film.title }" + ". Режиссер: #{person.film.director}"



