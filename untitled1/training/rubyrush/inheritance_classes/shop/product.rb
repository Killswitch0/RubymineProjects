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
  def initialize(options)
    @price = options[:price]
    @amount = options[:amount]
  end

  def to_string
    " #{@price} грн. (осталось #{@amount})"
  end

  # Метод update у родителя обновляет только цену и количество товара, если эти
  # ключи были переданы в ассоциативном массиве на вход
  def update(options)
    @price = options[:price] if options[:price]
    @amount = options[:amount] if options[:amount]
  end

  # Абстрактный метод from_file для продукта не имеет смысла, т.к. абстрактный
  # продукт из файла мы прочитать не сможем (мы не знаем, например, формат),
  # поэтому если он не определен у родителя, он будет возвращать ошибку. Класс
  # ошибки так и называется «ошибка отустствия имлементации».
  def self.from_file(file_path)
    raise NotImplementedError
  end
end