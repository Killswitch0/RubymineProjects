#Аналогично классу Product мы объявим сеттеры и геттеры для переменных
# экземпляра класса Film с помощью attr_accessor, чтобы их можно было менять
# из основной программы.
class Film < Product

  def to_s
    "Фильм: #{@title}, жанр: #{@genre}, режиссер: #{@director}, год: #{@year}. цена #{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя через "super", чтобы тот обновил цену и остаток.
  def update(options)
    super

    @title = options[:title] if options[:title]
    @genre = options[:genre] if options[:genre]
    @director = options[:director] if options[:director]
    @year = options[:year] if options[:year]
  end
end

