class Link < Post
  def initialize
    super

    @url = ''
  end

  def read_from_console
    puts "Адрес ссылки"
    @url = STDIN.gets.chomp

    puts "Что за ссылка?"
    @text = STDIN.gets.chomp
  end

  def to_strings
    time_string = "Создано #{@created_at.strftime('%Y.%m.%d, %H:%M:%S')}"

    [time_string, @url, @text]
  end

  def save
    file = File.new(file_path, "w:UTF-8")

    to_strings.each { |item| file.puts(item) }

    file.close

    puts "Ваша ссылка сохранена"
  end
end