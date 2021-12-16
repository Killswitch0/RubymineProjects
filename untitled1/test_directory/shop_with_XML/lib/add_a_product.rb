require 'rexml/document'

require_relative 'product'
require_relative 'film'
require_relative 'book'

product_types = Product.product_types

choice = nil

until (0..product_types.count).include?(choice)
  puts "Какой товар вы хотите добавить?"
  product_types.each_with_index  do |p, i|
    i += 1
    puts "#{i}: #{p.name}"
  end

  choice = STDIN.gets.chomp.to_i
  choice -= 1
end

puts "Укажите цену продукта?"
price = STDIN.gets.chomp.to_i

puts "Укажите количество?"
amount = STDIN.gets.chomp.to_i

product = product_types[choice].new(price, amount)

product.read_from_console

product.save_to_xml("data/products.xml")

