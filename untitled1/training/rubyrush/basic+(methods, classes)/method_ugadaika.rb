def guess_rand_number(n, rand_n)

  if n == rand_n
    abort 'Поздравляю, вы отгадали число!'
  end

  if n < rand_n
    print 'Нужно больше.'
  else
    print 'Нужно меньше.'
  end

  if (n - rand_n).abs < 3
    puts ' (Тепло)'
  else
    puts ' (Холодно)'
  end
end

puts 'Загадано число от 0 до 16. Напишите предполагаемое число и нажмите Enter'
rand_n = rand(16)
user_choice = gets.to_i
guess_rand_number(user_choice, rand_n)

puts "\nПопытка номер 2"
puts 'Загадано число от 0 до 16. Напишите предполагаемое число и нажмите Enter'
rand_n = rand(16)
user_choice = gets.to_i
guess_rand_number(user_choice, rand_n)

puts "\nПопытка номер 3"
puts 'Загадано число от 0 до 16. Напишите предполагаемое число и нажмите Enter'
rand_n = rand(16)
user_choice = gets.to_i
guess_rand_number(user_choice, rand_n)

puts "Было загадано число: #{rand_n}"



