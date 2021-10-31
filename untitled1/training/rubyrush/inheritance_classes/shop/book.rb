class Book < Product
  # Аналогично классу Product мы объявим сеттеры и геттеры для переменных
  # экземпляра класса Book с помощью attr_accessor, чтобы их можно было менять
  # из основной программы.
  attr_accessor :name,
                :genre,
                :author

  # Метод класса from_file считывает данные о книге из файла, путь к которому
  # ему передали в качестве параметра и передает их на вход своему же
  # конструктору с нужными ключами.
  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |l| l.chomp  }

    self.new(
      name: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3],
      amount: lines[4]
    )
  end

  def initialize(options)
    super

    @name = options[:name]
    @genre = options[:genre]
    @author = options[:author]
  end

  def to_string
    puts "Книга: #{@name}. Жанр: #{@genre}. Автор: #{@author}. #{super}"
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