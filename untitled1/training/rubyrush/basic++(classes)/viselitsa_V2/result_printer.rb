class ResultPrinter

  def print_status(game)
    puts "\nСлово: " + get_word_for_print(game.letters, game.good_letters)
    #метод join, вызванный к массиву, выводит все его элементы в строку,
    # разделяя его тем, что идет в параметрах этого метода
    # это похоже на вызов метода to_s, только join собирает все элементы массива в одну строчку,
    # без скобок, кавычек и т.п.
    puts "Ошибки (#{game.errors}): #{game.bad_letters.join(", ")}"

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


end