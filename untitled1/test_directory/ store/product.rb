class Product
  attr_accessor :price, :amount

  def initialize(options = {})
    @price = options[:price]
    @amount = options[:amount]
  end

  def self.product_types
    [Film, Book]
  end

  def self.create(type_index)
    product_types[type_index].new
  end

  def self.showcase(products)
    puts "*Какой из списка товаров хотите купить?*\n\n"

    products.each_with_index do |p, i|
      puts "#{i}: #{p}"
    end

    puts "\n*[X] - покинуть магазин*\n\n"
  end

  def read_from_console
    # to do
  end

  def file_path
    current_path = File.dirname(__FILE__ )

    film_file_path = current_path + '/data/film'
    book_file_path = current_path + '/data/book'

    prod_path = if self.class.name.to_s == Film.to_s
                  "#{film_file_path}/#{Time.now.strftime('%Y.%m.%d-%H:%M')}.txt"
                elsif self.class.name.to_s == Book.to_s
                  "#{book_file_path}/#{Time.now.strftime('%Y.%m.%d-%H:%M')}.txt"
                end

    prod_path
  end

  def save_to_txt
    file = File.new(file_path, "w:UTF-8")

    arr_to_save.each { |l| file.puts(l)}

    file.close
  end

  def to_s
    "#{@price} грн. (осталось: #{@amount} шт.)"
  end

  def arr_to_save
    # to do
  end

  def update(options)
    @price = options[:price] if options[:price]
    @amount = options[:amount] if options[:amount]
  end

  def self.read_from_file(file_path)
    # to do
  end
end