class Car

  attr_accessor :name, :weight

  def initialize(options = {})
    @items  = []
    @name   = options[:name]
    @weight = options[:weight]
  end

  def add_item(item)
    @items.push item
  end

  def remove_car
    @items.delete_at(0)
  end

end



car = Car.new
car.add_item Car.new({ weight: 300, name: 'Lamb' })
car.add_item Car.new({ weight: 320, name: 'Ferr' })


p car








