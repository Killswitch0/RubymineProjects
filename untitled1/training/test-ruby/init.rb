require_relative 'cart'
require_relative 'item'
require_relative 'ruby-traning/real_item'
require_relative 'ruby-traning/virtual_item'

item1 = VirtualItem.new({price: 25, name: 'Car'})
item2 = RealItem.new({weight: 120, name: 'Bike'})



cart = Cart.new
cart.add_item item1
cart.add_item item2
p cart









