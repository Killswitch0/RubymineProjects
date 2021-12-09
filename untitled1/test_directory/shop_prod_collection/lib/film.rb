class Film < Product

  def self.from_file(file_path)
    lines = File.readlines(file_path).map { |l| l.chomp }

    self.new(
      title: lines[0],
      genre: lines[1],
      year: lines[2].to_i,
      director: lines[3],
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def initialize(options)
    super

    @title = options[:title]
    @genre = options[:genre]
    @year = options[:year]
    @director = options[:director]
  end

  def to_s
    "Фильм: #{@title}. Жанр: #{@genre}. Год: #{@year}. Режиссер: #{@director}. #{super}"
  end

  def update(options)
    super

    @title = options[:title] if options[:title]
    @genre = options[:genre] if options[:genre]
    @year = options[:year] if options[:year]
    @director = options[:director] if options[:director]
  end
end