class Book < Product
  # Аналогично классу Product мы объявим сеттеры и геттеры для переменных
  # экземпляра класса Book с помощью attr_accessor, чтобы их можно было менять
  # из основной программы.
  attr_accessor :name, :genre, :author

  def initialize(options)
    super

    @name = options[:name]
    @genre = options[:genre]
    @author = options[:author]
  end

  def to_string
    puts "Книга: #{@name}. Жанр: #{@genre}. Автор: #{@author}. #{@price} грн. #{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя, чтобы тот обновил цену и остаток.
  def update(options)
    super

    @author = options[:title] if options[:title]
    @genre = options[:genre] if options[:genre]
    @author = options[:author] if options[:author]
  end
end