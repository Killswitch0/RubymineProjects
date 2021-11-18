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

  def to_s
    "#{@price} грн. (осталось: #{@amount})"
  end

  # Метод update у родителя обновляет только цену и количество товара, если эти
  # ключи были переданы в ассоциативном массиве на вход
  def update(options)
    @price = options[:price] if options[:price]
    @amount = options[:amount] if options[:amount]
  end

  def self.showcase(products)
    puts "Какой из списка товаров вы хотите купить?\n\n"

    # В цикле перебираем все элементы массива products,
    # где к index += 1, чтобы изменить начало нумерации товаров с 0 на 1
    products.each_with_index do |product, index|
      index += 1

      puts "#{index}: #{product.to_s}"
    end

    puts "Нажмите 'x' чтобы покинуть магазин"
  end

  def buy
    if @amount > 0
      puts "Товар куплен :)"
      @amount -= 1
      @price
    else
      puts "Товар закончился: #{@amount}"
      0
    end
  end

  def self.read_from_xml(file_name)
    # Получим абсолютный путь к файлу
    file_path = File.dirname(__FILE__ ) + "/" + file_name

    # Если файла нет, сразу закончим выполнение программы, сообщив об этом
    unless File.exist?(file_path)
      abort "Файл #{file_path} не найден"
    end

    # Открываем файл и передаём его в парсер
    file = File.new(file_path)
    doc = REXML::Document.new(file)
    file.close

    # Две временных переменных, которые мы будем использовать дальше
    result = []
    product = nil

    # Найдём все теги product, которые лежат внутри корневого тега products
    doc.elements.each("products/product") do |product_node|
      # Из атрибутов каждого такого тега достанем цену и количество на складе
      price = product_node.attributes["price"].to_i
      amount = product_node.attributes["amount"].to_i

      # По правилам формирования нашего файла в каждом теге product
      # Может быть только один элемент book, movie или disk
      # Таким образом, в два из этих цикла мы даже на зайдём
      product_node.each_element("film") do |film_node|
        # Сейчас мы находимся внутри тега film
        # И можем прочитать его аттрибуты и создать соответствующий класс
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

      # Теперь запишем созданный экземпляр в результирующий массив
      # и перейдём к следующему тегу product
      result.push(product)
    end

    # Наконец, вернём массив продуктов
    return result
  end
end



