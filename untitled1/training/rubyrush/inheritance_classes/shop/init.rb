# Подключаем классы товаров и классов-детей: фильмы
require_relative 'product'
require_relative 'movie'

# Пока функционал у нас очень простой, но фильм мы создать уже можем. Создадим
# новый товар — фильм за 250 грн, и скажем, на складе их осталось 5 штук.
leon = Movie.new(price: 250, amount: 5)

# Выведем информацию о товаре в консоль
puts "Фильм Леон стоит: #{leon.price}, количество #{leon.amount} штук"