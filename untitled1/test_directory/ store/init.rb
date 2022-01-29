require_relative 'product'
require_relative 'film'
require_relative 'book'
require_relative 'product_collection'


film = Film.new(title: 'Дневник Памяти',
                genre: 'драма',
                director: 'Чэндлер',
                year: 2004,
                price: 1250,
                amount: 3
)

book = Book.new(name: 'Под Куполом',
                genre: 'фантастика',
                author: 'Стивен Кинг',
                year: 2009,
                price: 2000,
                amount: 5

)

puts film
puts book

puts
puts


current_path = File.dirname(__FILE__ )

film_file_path = current_path + '/data/film/01.txt'
book_file_path = current_path + '/data/book/01.txt'

puts film = Film.read_from_file(film_file_path)
puts book = Book.read_from_file(book_file_path)

puts
puts

choice = nil
choicer = Product.product_types

puts "Добро пожаловать в создатель продуктов!"
puts "Какой продукт хотите создать?"

while choice == nil
  choicer.each_with_index do |p, i|
    puts "\t#{i}: #{p}"
  end

  choice = STDIN.gets.chomp.to_i
end

new_product = Product.create(choice)

new_product.read_from_console

new_product.save_to_txt

puts "Новый продукт добавлен!"

puts
puts

collection = ProductCollection.from_dir(File.dirname(__FILE__ ) + '/data')

collection.sort!(by: :price, order: :asc)

collection.to_a.each { |product| puts product }
















