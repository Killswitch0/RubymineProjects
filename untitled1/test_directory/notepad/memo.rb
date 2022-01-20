class Memo < Post

  def read_from_console
    puts "Новая заметка (будет записано все до строчки \"end\")"

    @text = []
    line = nil

    while line != 'end'
      line = STDIN.gets.chomp
      @text << line
    end

    @text.pop
  end

  def to_strings
    time_string = "Создано #{@created_at.strftime('%Y.%m.%d, %H.%M.%S')}"

    @text.unshift(time_string)
  end

  def save
    file = File.new(file_path, "w:UTF-8")
    time_string = "Создано #{@created_at.strftime('%Y.%m.%d, %H.%M.%S')}"
    file.puts(time_string)

    @text.each { |item| file.puts(item) }

    file.close

    puts "Запись сохранена"
  end
end