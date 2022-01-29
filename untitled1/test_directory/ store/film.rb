require_relative 'module'

class Film < Product
  include FilmInstVar

  attr_accessor :title,
                :director,
                :genre,
                :year

  def initialize(options = {})
    super

    @title = options[:title]
    @director = options[:director]
    @genre = options[:genre]
    @year = options[:year]
  end

  def to_s
    "Фильм: #{@title}. Жанр: #{@genre}. Год: #{@year}. Режиссер: #{@director}. #{super}"
  end

  def read_from_console
    puts 'Какой фильм хотите добавить?'
    @title = STDIN.gets.chomp

    puts 'Режиссер?'
    @director = STDIN.gets.chomp

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

    @title = options[:title] if options[:title]
    @director = options[:director] if options[:director]
    @genre = options[:genre] if options[:genre]
    @year = options[:year] if options[:year]
  end

  def self.read_from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8').map { |l| l.chomp }

    self.new(
      title: lines[0],
      director: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4],
      amount: lines[5]
    )
  end
end