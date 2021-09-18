require_relative 'string'
require_relative 'item_container'
require_relative 'item'
require_relative 'virtual_item'
require_relative 'real_item'
require_relative 'antique_item'
require_relative 'cart'
require_relative 'order'



@items = []
@items << AntiqueItem.new({ price: 240, weight: 290, name: 'car' }) # << то же самое, что и .push
@items << RealItem.new({ price: 270, weight: 300, name: 'cycle' })
@items << RealItem.new({ price: 250, weight: 310, name: 'bike' })

cart = Cart.new("max")
cart.add_item RealItem.new({ price: 270, weight: 300, name: 'car' })
cart.add_item RealItem.new({ price: 290, weight: 320, name: 'car' })
cart.add_item RealItem.new({ price: 250, weight: 360, name: 'bike' })

puts cart.all_cars



















































