
rand_number = rand(15)
puts 'Загадано случайное число от 0 до 15'
your_numb = gets.chomp.to_i

if your_numb == rand_number
  abort 'Поздравляю! Вы отгадали число!'
else
  if your_numb < rand_number
    print "Нужно больше"
  else
    print "Нужно меньше"
  end
  if (your_numb - rand_number).abs < 3
    puts '.(Тепло)'
  else
    puts '.(Холодно)'
  end
end

puts "Было загадано число #{rand_number}"
puts ""
puts "Попытка номер 22"
puts ""

your_numb = gets.chomp.to_i

if your_numb == rand_number
  abort 'Поздравляю! Вы отгадали число!'
else
  if your_numb < rand_number
    print "Нужно больше"
  else
    print "Нужно меньше"
  end
  if (your_numb - rand_number).abs < 3
    puts '.(Тепло)'
  else
    puts '.(Холодно)'
  end
end

puts "Было загадано число #{rand_number}"
puts ""
puts "Попытка номер 3"
puts ""

your_numb = gets.chomp.to_i

if your_numb == rand_number
  abort 'Поздравляю! Вы отгадали число!'
else
  if your_numb < rand_number
    print "Нужно больше"
  else
    print "Нужно меньше"
  end
  if (your_numb - rand_number).abs < 3
    puts '.(Тепло)'
  else
    puts '.(Холодно)'
  end
end

puts ""
puts "Вы не отгадали. Было загадано число #{rand_number}"




