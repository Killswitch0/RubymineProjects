# Аналогично классу Product мы объявим сеттеры и геттеры для переменных
# экземпляра класса Book с помощью attr_accessor, чтобы их можно было менять
# из основной программы.
class Book < Product
  attr_accessor :title,
                :genre,
                :author

  # Метод класса from_file считывает данные о книге из файла, путь к которому
  # ему передали в качестве параметра и передает их на вход своему же
  # конструктору с нужными ключами.
  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |l| l.chomp }

    self.new(
      title: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3],
      amount: lines[4]
    )
  end

  # Конструктор товара записывает, сколько стоит товар и сколько осталось
  def initialize(options)
    super

    @title = options[:title]
    @genre = options[:genre]
    @author = options[:author]
  end

  def to_s
    "Книга: #{@title}, жанр: #{@genre}, автор: #{@author}, #{super}"
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