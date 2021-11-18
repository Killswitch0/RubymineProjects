require 'rexml/document'

# Подключаем классы товаров и классов-детей: фильмы
require_relative 'product'
require_relative 'book'
require_relative 'film'

total_price = 0
choice = nil

# Всё, что мы поменяем, это то, как мы получаем массив продуктов
# Раньше мы генерили его руками, теперь этим будет заниматься статический метод
# read_from_xml, которому мы будем передавать относительный путь к файлу
products = Product.read_from_xml('data/products.xml')

while choice != "x"
  Product.showcase(products)

  # to_i в конце для перевода строки в число, где оно выступает номером
  # для выбора соответствующего продукта в массиве.
  #
  # Поскольку нумерация списка продуктов начинается с 1
  # choice -= 1 нужен для выбора элемента в порядке индексации массива,
  # а именно с 0.
  choice = STDIN.gets.chomp.to_i
  choice -= 1

  if choice != "x" && choice.to_i < products.size && choice.to_i >= 0
    product = products[choice.to_i]

    total_price += product.buy
  else
    abort "Спасибо за покупки. С вас #{total_price} грн."
  end
end












