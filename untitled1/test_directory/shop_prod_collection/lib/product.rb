class Product
  attr_accessor :price,
                :amount

  def initialize(options)
    @price = options[:price]
    @amount = options[:amount]
  end

  def to_s
    "#{@price} грн. (Осталось: #{@amount})"
  end

  def update(options)
    @price = options[:price] if options[:price]
    @amount = options[:amount] if options[:amount]
  end

  def self.from_file(file_path)

  end
end