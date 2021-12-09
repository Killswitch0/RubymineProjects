class Film < Product

  def to_s
    "Фильм: #{@title}. Жанр: #{@genre}. Год: #{@year}. Режиссер: #{@director}. #{super}"
  end

  def read_from_console
    puts "Укажите название фильма..."
    @title = STDIN.gets.chomp

    puts "Укажите жанр..."
    @genre = STDIN.gets.chomp

    puts "Укажите год..."
    @year = STDIN.gets.chomp

    puts "Укажите режиссера..."
    @director = STDIN.gets.chomp
  end

  def to_xml
    product = super
    product.add_element('film', {
      'title' => @title,
      'genre' => @genre,
      'year' => @year,
      'director' => @director
    })
    product
  end

  def update(options)
    super

    @title = options[:title] if options[:title]
    @genre = options[:genre] if options[:genre]
    @year = options[:year] if options[:year]
    @director = options[:director] if options[:director]
  end
end