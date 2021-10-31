# Подключаем классы товаров и классов-детей: фильмы
require_relative 'product'
require_relative 'book'
require_relative 'movie'

#Подключаем ProductCollection
require_relative 'product_collection'

# Пока функционал у нас очень простой, но фильм мы создать уже можем. Создадим
# новый товар — фильм за 250 грн, и скажем, на складе их осталось 5 штук.
leon = Movie.new(price: 250, amount: 5)

# Выведем информацию о товаре в консоль
puts "Фильм Леон стоит: #{leon.price}, количество #{leon.amount} штук \n\n"

# Создадим несколько продуктов и поменяем их с помощью сеттеров и метода update
book = Book.new(name: "Под Куполом",
                genre: "фантастика",
                author: "Стивен Кинг",
                price: 200,
                amount: 3
)

film = Movie.new(name: "Матрица",
                 genre: "кибер-панк",
                 author: "Сестры Вачовски",
                 price: 300,
                 amount: 1
)

book.to_string
book.price = 960
book.to_string
book.update(price: 1100)
book.to_string

puts

film.to_string
film.price = 650
film.to_string
film.update(price: 1000)
film.to_string

puts "_____________________________\n\n"


# Здесь мы реализовываем функционал считывания файлов из папки "data"
film2 = Movie.from_file("data/films/01.txt")
film2.to_string

puts

book2 = Book.from_file("data/books/01.txt")
book2.to_string

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
begin
  Product.from_file("data/films/01.txt")
rescue NotImplementedError
  puts "[ Метод класса Product.form_file не реализован ]"
end

puts "_____________________________________\n\n\n"

# Создаем коллекцию продуктов, передавая методу класса from_dir путь к папке
# с подпапками films и books. ProductCollection сам знает, как там внутри лежат
# эти файлы и сам разбереться, как их оттуда считать.
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')

# Сортируем продукты по возрастанию цены с помощью метода sort! экземпляра
# класса ProductCollection
collection.sort!(by: :price, order: :asc)

# Получаем массив продуктов методом to_a и выводим каждый на экран, передавая
# его методу puts в качестве аргумента.
collection.to_a.each do |product|
  puts product
end


