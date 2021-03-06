class Item
  attr_reader   :real_price
  attr_accessor :weight, :name, :price

  @@discount = 0.1

  def initialize(options = {})
    @real_price  = options[:price]
    @name   = options[:name]
    @weight = options[:weight]
    @price  = options[:price]
  end

  def info
    if block_given?
      yield price
      yield name
    else
      puts 'Nothing to show'
    end
  end

  def self.discount
    if Time.now.month == 7
      @@discount += 0.3
    else
      @@discount
    end
  end

  def price
  if @real_price
  (@real_price - @real_price * self.class.discount) + tax
  end
 end

  def to_s
  "#{self.price}:#{self.weight}:#{self.name}"
  end

  private

  def tax
    type_tax = if self.class == VirtualItem
                 1
               else
                 2
               end
    cost_tax = if @real_price > 5
                 @real_price * 0.2
               else
                 @real_price * 0.1
               end
    type_tax + cost_tax
  end
end
















