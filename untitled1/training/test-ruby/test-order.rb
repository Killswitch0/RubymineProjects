
class Item
  def initialize
    @price  = 300
    @height = 300
  end

  #attr_reader :price, :height
  #attr_writer :price, :height

  attr_accessor :price, :height
end

item1 = Item.new
item2 = Item.new

item1.price  = 10
item1.height = 10

item2.price  = 20
item2.height = 30

p item1.price
p item1.height

p item2.price
p item2.height

puts '_________'

class Item
  def initialize
    @price  = 300
    @height = 200
  end

  #attr_reader :price, :height
  #attr_writer :price, :height

  attr_accessor :price, :height
end

item1 = Item.new

item1.price  = 200
item1.height = 400

p item1.price
p item1.height






