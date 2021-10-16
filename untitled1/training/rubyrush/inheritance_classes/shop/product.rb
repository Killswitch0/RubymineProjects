# Класс-родитель Товар, у которого есть цена и остаток на складе. От этого
# класса мы будем наследовать все другие товары.
class Product
  # У любого экземпляра класса Товар будут как минимум две переменные — цена
  # и количество единиц товара на складе
  attr_accessor :price, :amount


  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(options)
    @price = options[:price]
    @amount = options[:amount]
  end

  def to_string
    # to do
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
  end
end