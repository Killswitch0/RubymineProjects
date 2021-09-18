class ResultPrinter

  def initialize
    @status_image = []

    current_path = File.dirname(__FILE__)
    counter = 0

    while counter <= 7
      file_name = current_path + "/image/#{counter}.txt"

      if File.exist?(file_name)
        f = File.new(file_name)
        @status_image << f.read
        f.close
      else
        puts "\n[ Изображение не найдено ]\n"
      end

      counter += 1
    end
  end

  def print_status(game)
    cls

    puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)
    #метод join, вызванный к массиву, выводит все его элементы в строку,
    # разделяя его тем, что идет в параметрах этого метода
    # это похоже на вызов метода to_s, только join собирает все элементы массива в одну строчку,
    # без скобок, кавычек и т.п.
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

    print_viselitsa(game.errors)

    if game.status == -1
      puts "Вы проиграли:("
    else
      if game.status == 1
        puts "Поздравляю! Вы выиграли :)\n\n"
      else
        puts "У вас осталос попыток: " + (7 - game.errors).to_s
      end
    end
  end

  def get_word_for_print(letters, good_letters)
    result = ""

    letters.each do |letter|
      if good_letters.include?(letter)
        result += letter + " "
      else
        result += "__ "
      end
    end

    return result
  end

  def cls
    system "clear" or system "cls"
  end

  def print_viselitsa(errors)
    puts @status_image[errors]
  end




end