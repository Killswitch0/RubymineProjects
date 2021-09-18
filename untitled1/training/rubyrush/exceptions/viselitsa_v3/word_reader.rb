class WordReader

  def read_from_file(file_name)
    begin
      f = File.new(file_name)
      lines = f.readlines
      f.close
      lines.sample.chomp # Ruby всегда возвращает последнюю строчку кода(особенность языка)
    rescue SystemCallError => errors
      # Если файл со словами не удалось открыть, нет смысла играть, поэтому тут
      # в пору закрыть программу и написать об этом пользователю
      abort "[ Файл со словами не найден ]: " + errors.message

      # Важная оговорка: в профессиональной разработке классу не очень хорошо
      # доверять закрытие программы, класс должен «кинуть» ошибку, которую затем
      # нужно поймать в основной программе все тем же begin-rescue, но для
      # простоты мы сейчас поступим именно так.
      #
      # https://ruby-doc.org/core-2.4.0/Kernel.html#method-i-raise
    end

    return lines.sample.chomp
  end
end