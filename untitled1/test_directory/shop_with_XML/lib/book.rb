class Book < Product

  def to_s
    "Книга: #{@name}. Жанр: #{@genre}. Режиссер: #{@author}. #{super}"
  end

  def read_from_console
    puts "Укажите название книги..."
    @name = STDIN.gets.chomp

    puts "Укажите жанр..."
    @genre = STDIN.gets.chomp

    puts "Укажите автора..."
    @author = STDIN.gets.chomp
  end

  def to_xml
    product = super
    product.add_element('book', {
      'name' => @name,
      'genre' => @genre,
      'author' => @author
    })
    product
  end

  def update(options)
    super

    @name = options[:name] if options[:name]
    @genre = options[:genre] if options[:genre]
    @author = options[:author] if options[:author]
  end
end