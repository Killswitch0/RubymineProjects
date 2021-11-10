require 'rexml/document'

# Подключаем классы товаров и классов-детей: фильмы
require_relative 'product'
require_relative 'book'
require_relative 'film'

product = Product.read_from_xml('data/products.xml')

Product.showcase(product)











