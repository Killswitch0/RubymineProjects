require 'rexml/document'

# Подключаем классы товаров и классов-детей: фильмы
require_relative 'product'
require_relative 'book'
require_relative 'film'

products = Product.read_from_xml('data/products.xml')

puts products


