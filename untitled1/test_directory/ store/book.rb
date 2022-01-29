require_relative 'module'

class Book < Product
  include BookInstVer

  attr_accessor :name,
                :author,
                :genre,
                :year

  def initialize(options = {})
    super

    @name = options[:name]
    @author = options[:author]
    @genre = options[:genre]
    @year = options[:year]
  end

  def to_s
    "Книга: #{@name}. Жанр: #{@genre}. Год: #{@year}. Режиссер: #{@author}. #{super}"
  end

  def read_from_console
    puts 'Какую книгу хотите добавить?'
    @name = STDIN.gets.chomp

    puts 'Автор?'
    @author = STDIN.gets.chomp

    puts "Жанр?"
    @genre = STDIN.gets.chomp

    puts "Год?"
    @year = STDIN.gets.chomp

    puts "Цена?"
    @price = STDIN.gets.chomp

    puts "Кол-во?"
    @amount = STDIN.gets.chomp
  end

  def update(options)
    super

    @name = options[:name] if options[:name]
    @author = options[:author] if options[:author]
    @genre = options[:genre] if options[:genre]
    @year = options[:year] if options[:year]
  end

  def self.read_from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      name: lines[0],
      author: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4],
      amount: lines[5]
    )
  end
end