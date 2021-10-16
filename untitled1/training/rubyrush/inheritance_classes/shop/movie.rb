# Класс фильм
class Movie < Product
  attr_accessor :genre, :author, :name

  def initialize(options)
    super

    @name = options[:name]
    @genre = options[:genre]
    @author = options[:author]
  end

  def to_string
    puts "Фильм: #{@name}. Жанр: #{@genre}. Автор: #{@author}. #{@price} грн. (Осталось: #{@amount})"
  end

  def update(params)
    super

    @author = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @author = params[:author] if params[:author]
  end
end