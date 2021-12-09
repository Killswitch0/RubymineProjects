class Book < Product

  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |l| l.chomp }

    self.new(
      name: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def initialize(options)
    super

    @name = options[:name]
    @genre = options[:genre]
    @author = options[:author]
  end

  def to_s
    "Книга: #{@name}. Жанр: #{@genre}. Режиссер: #{@author}. #{super}"
  end

  def update(options)
    super

    @name = options[:name] if options[:name]
    @genre = options[:genre] if options[:genre]
    @author = options[:author] if options[:author]
  end
end