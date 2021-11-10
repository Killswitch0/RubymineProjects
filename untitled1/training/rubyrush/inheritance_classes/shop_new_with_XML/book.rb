# Аналогично классу Product мы объявим сеттеры и геттеры для переменных
# экземпляра класса Book с помощью attr_accessor, чтобы их можно было менять
# из основной программы.
class Book < Product

  def to_s
    "Книга: #{@title}, жанр: #{@genre}, автор: #{@author}. цена #{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя, чтобы тот обновил цену и остаток.
  def update(options)
    super

    @title = options[:title] if options[:title]
    @genre = options[:genre] if options[:genre]
    @author = options[:author] if options[:author]
  end
end