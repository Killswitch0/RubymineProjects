# Класс-родитель Товар, у которого есть цена и остаток на складе. От этого
# класса мы будем наследовать все другие товары.
class Product
  # Чтобы цену и остаток товара можно было менять прямо по ссылке экземпляра:
  #
  # product.price = 100
  #
  # Мы должны объявить методы-сеттеры для каждой из переменных.
  #
  # def price=(price)
  #   @price = price
  # end
  #
  # Также это можно сделать с помощью attr_accessor
  attr_accessor :price,
                :amount

  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(price, amount)
    @price = price
    @amount = amount
  end

  def self.showcase(products)
    puts "Вот список товаров:"

    products.each_with_index do |product, index|
      index += 1

      puts "#{index}: #{product.to_s}"
    end
  end

  def self.read_from_xml(file_name)
    file_path = File.dirname(__FILE__ ) + "/" + file_name

    unless File.exist?(file_path)
      abort "Файл #{file_path} не найден"
    end

    file = File.new(file_path)
    doc = REXML::Document.new(file)
    file.close

    result = []
    product = nil

    doc.elements.each("products/product") do |product_node|
      price = product_node.attributes["price"].to_i
      amount = product_node.attributes["amount"].to_i

      product_node.each_element("film") do |film_node|
        product = Film.new(price, amount)
        product.update(
          title: film_node.attributes["title"],
          director: film_node.attributes["director"],
          genre: film_node.attributes["genre"],
          year: film_node.attributes["year"]
        )
      end

      product_node.each_element("book") do |book_node|
        product = Book.new(price, amount)
        product.update(
          title: book_node.attributes["title"],
          author: book_node.attributes["author"],
          genre: book_node.attributes["genre"]
        )
      end

      result.push(product)
    end

    return result
  end

  def to_s
    "#{@price} грн. (осталось: #{@amount})"
  end

  # Метод update у родителя обновляет только цену и количество товара, если эти
  # ключи были переданы в ассоциативном массиве на вход
  def update(options)
    @price = options[:price] if options[:price]
    @amount = options[:amount] if options[:amount]
  end
end



