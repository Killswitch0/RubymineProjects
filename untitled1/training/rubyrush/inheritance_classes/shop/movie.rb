# Класс фильм
class Movie < Product
  # Аналогично классу Product мы объями сеттеры и геттеры для переменных
  # экземпляра класса Film с помощью attr_accessor, чтобы их можно было менять
  # из основной программы.
  attr_accessor :genre,
                :author,
                :name

  def initialize(options)
    super

    @name = options[:name]
    @genre = options[:genre]
    @author = options[:author]
  end

  # Метод класса from_file считывает данные о фильме из файла, путь к которому
  # ему передали в качестве параметра и передает их на вход своему же
  # конструктору с нужными ключами.
  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |l| l.chomp  }

    self.new(name: lines[0],
             genre: lines[1],
             author: lines[2],
             price: lines[3].to_i,
             amount: lines[4].to_i
    )
  end

  def to_string
    puts "Фильм: #{@name}. Жанр: #{@genre}. Автор: #{@author}.#{super}"
  end

  # Метод update у ребенка обновляет специфичные для ребенка поля и вызывает
  # метод родителя через "super", чтобы тот обновил цену и остаток.
  def update(options)
    super

    @author = options[:title] if options[:title]
    @genre = options[:genre] if options[:genre]
    @author = options[:author] if options[:author]
  end
end