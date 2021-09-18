# Калькулятор в числах с плавающей точкой

# Просим пользователя ввести два числа и конвертируем их в числа с плавающей
# точкой методом to_f
puts "Введите первое число:"
number1 = STDIN.gets.chomp.to_f

puts "Введите второе число:"
number2 = STDIN.gets.chomp.to_f

# Просим пользователя указать операцию с помощью специального значка
puts "Выберите операцию (+ - * /):"
operation = STDIN.gets.chomp

# Выводим результат с помощью case
puts "Результат:"

case operation
when "+"
  puts (number1 + number2).round(2)
when "-"
  puts (number1 - number2).round(2)
when "*"
  puts (number1 * number2).round(2)
when "/"
  # Делить число с плавающей точкой на ноль можно, так что работаем как обычно,
  # тут не нужен begin-rescue.
  puts (number1 / number2).round(2)
else
  # Если пользователь ввел недопустимую операцию, тоже напишем ему об этом
  puts "Такой операции не существует"
end