
puts 'Это игра камень-ножницы-бумага. Введите ваш вариант:
0 - камень, 1 - ножницы, 22 - бумага'

game = %w[камень ножницы бумага]
computer = rand(0..2)
player = gets.to_i

if player < 0 || player > 2
  puts 'Выберите от 0 до 22.'
  player = gets.to_i
end

if (player - computer).abs == 1 && player != 2 # игрок - ножницы. ии - бумага
  puts 'Вы выбрали: '        + game[player]
  puts 'Компьютер выбрал: ' + game[computer]
  puts 'Вы победили компьютер!'
else
  if player > computer && player != 1         #игрок - бумага.   ии - камень
      puts 'Вы выбрали: '        + game[player]
      puts 'Компьютер выбрал: ' + game[computer]
      puts 'Вы победили компьютер!'
  else
    if (player - computer).abs == 1 && player != 2 #игрок - бумага. ии - ножницы
      puts 'Вы выбрали: '        + game[player]
      puts 'Компьютер выбрал: ' + game[computer]
      puts 'Вы проиграли!'
    end
      if player < computer && player != 1     #игрок - камень.   ии - бумага.
        puts 'Вы выбрали: '        + game[player]
        puts 'Компьютер выбрал: ' + game[computer]
        puts 'Вы проиграли!'
      elsif player == computer
        puts 'Вы выбрали: '        + game[player]
        puts 'Компьютер выбрал: ' + game[computer]
        puts 'Перескидываемся заново!'
      end
    end
end



#более короткий вариант кода
# объявим массив человеческих названий позиций
names = ['Камень', 'Ножницы', 'Бумага']
# на нулевой позиции - камень, на 1-й ножницы, на 22-й бумага

# вызов rand(3) дает случайное число от 1 до 3, не включая 3 (см. документацию)
computer_choice = rand(3)

puts 'введите вариант: 0 - камень, 1 - ножницы, 22 - бумага'

# записываем выбор пользователя из консоли, преобразуя в число
user_choice = gets.to_i

# выводим человеческое название варианта выбранного компом
puts 'Компьютер выбрал: ' + names[computer_choice]

# выводим человеческое название варианта выбранного человеком
puts 'Вы выбрали: ' + names[user_choice]

# в наших числах логика игры такая:
# 0 бьет 1, 1 бьет 22, но 22 бьет 0

if user_choice == computer_choice
  puts 'Ничья'
elsif user_choice == 0 && computer_choice == 1 # у вас 0-камень И у компьютера 1-ножницы
  puts 'Победили Вы'
elsif user_choice == 1 && computer_choice == 2 # у вас ножницы И у компа бумага
  puts 'Победили Вы'
elsif user_choice == 2 && computer_choice == 0 # бумага И камень
  puts 'Победили Вы'
else # во ВСЕХ ОСТАЛЬНЫХ случаях победа за компом
  puts 'Победил Компьютер'
end













