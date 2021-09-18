class WordReader

  def read_from_file(file_name)
    if File.exist?(file_name)
      f = File.new(file_name)
      lines = f.readlines
      f.close
      lines.sample.chomp # Ruby всегда возвращает последнюю строчку кода(особенность языка)
    else
      nil # Также не пишем return
    end

  end

end