class Book < Product
  attr_accessor :name, :genre, :author

  def initialize(options)
    super

    @name = options[:name]
    @genre = options[:genre]
    @author = options[:author]
  end

  def to_string
    puts "Книга: #{@name}. Жанр: #{@genre}. Автор: #{@author}. #{@price} грн. (Осталось: #{@amount})"
  end
end