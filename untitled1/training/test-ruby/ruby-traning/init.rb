#Dir["*.rb"].each { |file| require_relative "#{file}" }
require_relative 'item'
require_relative 'item_container'
require_relative 'cart'
require_relative 'order'
require_relative 'virtual_item'
require_relative 'real_item'




item1 = VirtualItem.new({price: 25, name: 'Car' })
item2 = RealItem.new({weight: 120, name: 'Car' })
item3 = RealItem.new({weight: 120, name: 'Car' })

cart = Cart.new

cart.add_item item1
cart.add_item item2
cart.add_item item3
p cart.items.size

order = Order.new
order.add_item item1
order.add_item item2
order.add_item item3
p order.items.size
p order.count_valid_items



