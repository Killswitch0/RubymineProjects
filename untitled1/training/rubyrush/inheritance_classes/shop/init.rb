# Подключаем классы товаров и классов-детей: фильмы
require_relative 'product'
require_relative 'movie'
require_relative 'book'

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

film2 = Movie.from_file("data/films/01.txt")
film2.to_string

# Пытаемся вызвать метод from_file у класса Product и ловим ошибку
begin
  Product.from_file("data/films/01.txt")
rescue
  puts "Метод класса Product.form_file не реализован"
end



