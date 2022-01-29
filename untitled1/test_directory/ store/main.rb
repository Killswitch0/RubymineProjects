require_relative 'product'
require_relative 'film'
require_relative 'book'
require_relative 'product_collection'


collection = ProductCollection.from_dir(File.dirname(__FILE__ ) + '/data')

collection.sort!(by: :price, order: :asc)

collection.to_a.each do |product|
  puts product
end

puts
puts

show_prod = Product.showcase(collection.to_a)

puts show_prod
