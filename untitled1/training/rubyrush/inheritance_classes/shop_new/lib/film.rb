#Аналогично классу Product мы объявим сеттеры и геттеры для переменных
# экземпляра класса Film с помощью attr_accessor, чтобы их можно было менять
# из основной программы.
class Film < Product
  attr_accessor :title,
                :genre,
                :director

  # Метод класса from_file считывает данные о фильме из файла, путь к которому
  # ему передали в качестве параметра и передает их на вход своему же
  # конструктору с нужными ключами.
  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |l| l.chomp}

    self.new(
      title: lines[0],
      genre: lines[1],
      director: lines[2],
      price: lines[3],
      amount: lines[4]
    )
  end

  def initialize(options)
    super

    @title = options[:title]
    @genre = options[:genre]
    @director = options[:director]
  end

  def to_s
    "Фильм: #{@title}, жанр: #{@genre}, режиссер: #{@director}, #{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя через "super", чтобы тот обновил цену и остаток.
  def update(options)
    super

    @title = options[:title] if options[:title]
    @genre = options[:genre] if options[:genre]
    @director = options[:director] if options[:director]
  end
end

