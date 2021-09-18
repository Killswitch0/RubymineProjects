# Просим пользователя ввести 2 числа
puts "Первое число:"
number1 = STDIN.gets.chomp.to_i

puts "Второе число:"
number2 = STDIN.gets.chomp.to_i

# Просим пользователя указать операцию с помощью специального значка
puts "Выберите операцию (+ - * /):"
operation = gets.chomp

#while operation == "/" && number2 == 0
#puts "На ноль делить нельзя. Введите новое число:"
#end

# Выводим результат с помощью case
case operation
when "+"
  add = number1 + number2
  puts "Результат: #{add.to_s}"
when "-"
  sub = number1 - number2
  puts "Результат: #{sub.to_s}"
when "*"
  mult = number1 * number2
  puts "Результат: #{mult.to_s}"
when "/"
  begin
    div = number1 / number2
    puts "Результат: #{div.to_s}"
    # Если в процессе выполнения этого кода возникла ошибка ZeroDivisionError,
    # мы пойдём по другому пути и выведем сообщение пользователю
  rescue ZeroDivisionError => error
    puts "На ноль делить нельзя: " + error.message
  end
else
  # Если пользователь ввел абракадабру - сообщим ему об этом
  puts "Нет такой операции"
end

