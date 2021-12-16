class Product
  attr_accessor :price,
                :amount

  def initialize(price, amount)
    @price = price
    @amount = amount
  end

  def self.showcase(products)
    puts "Что хотите купить?\n\n"

    products.each_with_index do |product, index|
      puts "#{index}: #{product}"
    end

    puts "x. Покинуть магазин\n\n"
  end

  def buy
    if @amount > 0
      puts "Поздравляю, вы купили товар :)"
      @amount -= 1
      @price
    else
      puts "Товар закончился!"
      0
    end
  end

  def self.read_from_xml(file_name)
    file_path = File.dirname(__FILE__ ) + file_name

    unless File.exist?(file_path)
      abort "Файл #{file_path} не найден"
    end

    result = []
    product = nil

    file = File.new(file_path, "r:UTF-8")
    doc = REXML::Document.new(file)
    file.close

    doc.elements.each("products/product") do |product_node|
      price = product_node.attributes["price"].to_i
      amount = product_node.attributes["amount"].to_i

      product_node.each_element("film") do |film|
        product = Film.new(price, amount)
        product.update(
          title: film.attributes["title"],
          director: film.attributes["director"],
          year: film.attributes["year"],
          genre: film.attributes["genre"]
        )
      end

      result.push(product)
    end

    result
  end

  def read_from_console
  end

  def to_xml
    el = REXML::Element.new('product')
    el.attributes['price'] = @price
    el.attributes['amount'] = @amount
    el
  end

  def save_to_xml(file_name)
    file_path = File.dirname(__FILE__ ) + "/" + file_name

    abort "Файл #{file_path} не найден" unless File.exist?(file_path)

    file = File.new(file_path, "r:UTF-8")
    doc = REXML::Document.new(file)
    file.close

    file = File.new(file_path, "w:UTF-8")
    doc.root.add_element(self.to_xml)
    doc.write(file, 2)
    file.close

    puts "Продукт успешно сохранен!"
  end

  def self.product_types
    [Film, Book]
  end

  def to_s
    "#{@price} грн. (Осталось: #{@amount})"
  end

  def update(options)
    @price = options[:price] if options[:price]
    @amount = options[:amount] if options[:amount]
  end
end