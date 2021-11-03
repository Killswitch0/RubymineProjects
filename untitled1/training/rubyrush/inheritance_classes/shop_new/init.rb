# Подключаем классы товаров и классов-детей: фильмы
require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'

#Подключаем ProductCollection
require_relative 'lib/product_collection'


# Создаем коллекцию продуктов, передавая методу класса from_dir путь к папке
# с подпапками films и books. ProductCollection сам знает, как там внутри лежат
# эти файлы и сам разбереться, как их оттуда считать.
collection = ProductCollection.from_dir(File.dirname(__FILE__ ) + '/data')

# Сортируем продукты по возрастанию цены с помощью метода sort! экземпляра
# класса ProductCollection
collection.sort!(by: :amount, order: :asc)

# Получаем массив продуктов методом to_a и выводим каждый на экран, передавая
# его методу puts в качестве аргумента.
collection.to_a.each do |product|
  puts product
end


