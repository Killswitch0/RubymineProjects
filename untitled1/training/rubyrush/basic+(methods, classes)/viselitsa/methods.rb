def get_letters

  slovo = ARGV[0]

  if slovo == nil || slovo == ""
    abort "Вы не ввели слово для игры"
  end

  return slovo.split("")
end

def get_user_input
  letter = ""

  while letter == ""
    letter = STDIN.gets.chomp
  end

  return letter
end

def check_result(user_input, letters, good_letters, bad_letters)
  if good_letters.include?(user_input) || bad_letters.include?(user_input)
    return 0
  end
  if letters.include? user_input                #если введенная пользователем буква содержится в "letters",
    good_letters << user_input                    #то добавляем введенное пользователем слово в массив "good_letters"
    if letters.uniq.size == good_letters.size   #условие, когда отгадано все слово.
      return 1
    else
      return 0
    end
  else
    bad_letters << user_input
    return -1
  end
end


def get_word_for_print(letters, good_letters)
  result = ""

  letters.each { |letter|
    if good_letters.include? letter
      result += letter + " "
    else
      result += "__ "
    end
  }

  return result
end


#1.Выводить залагаданное слово, как в поле чудес
#2.Информацию об ошибках и уже названные буквы
#3.Ошибок > 7 - сообщить о поражении
#4.Слово угадано - сообщить о победе
def print_status(letters, good_letters, bad_letters, errors)
  puts "\nСлово: " + get_word_for_print(letters, good_letters)
  puts "Ошибки (#{errors}): #{bad_letters.join(", ")}"

  if errors >= 7
    puts "Вы проиграли :("
  else
    if letters.uniq.size == good_letters.size
      puts "Поздравляем! Вы выиграли!\n\n"
    else
      puts "У вас осталось попыток: " + (7-errors).to_s
    end
  end
end


