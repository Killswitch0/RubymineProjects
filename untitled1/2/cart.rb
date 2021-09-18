require_relative 'item_container'

class Cart
  attr_reader :items
  include ItemContainer
  class ItemNotSupported < StandardError; end

  UNSUPPORTED_ITEMS = [AntiqueItem, VirtualItem]


  def initialize(owner)
    @items = []
    @owner = owner
  end

  def save_to_file
    File.open(@owner.to_s + '_cart_txt', 'w') do |f| #f - дескриптор файоа
      @items.each do |i|
        raise ItemNotSupported if UNSUPPORTED_ITEMS.include?(i.class) #содежрит ли массив U_I один из запрещенных классов?
        f.puts i
      end
    end
  end

  def read_from_file
      File.readlines(@owner.to_s + '_cart.txt').each { |i| @items << i.to_real_item }
      @items.uniq!
    rescue Errno::ENOENT #выполнить код в исключительой ситуации: если есть ошибка Errno::ENOENT
      File.open(@owner.to_s + '_cart_txt', 'w') {}
      puts "file #{@owner}_cart.txt created"
  end

end





