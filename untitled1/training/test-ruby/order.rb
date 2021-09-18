class Item
  def price
    @price
  end

  def price=(value)
    @price = value
  end
end

item1 = Item.new
item2 = Item.new

item1.price = 10
p item1.price

item2.price = 20
p item2.price





