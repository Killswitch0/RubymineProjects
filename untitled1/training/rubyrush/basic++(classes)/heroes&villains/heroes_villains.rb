
puts "Врага какого персонажа вы хотите узнать?"
puts "\"Бэтмен, Шерлок Холмс, Железный Человек\"\n\n"

#переменная, где будет храниться ввод пользователя
user_word = STDIN.gets.chomp

#Пока в переменной user_word ничего не будет, а именно: nil - ничего, пустота; "" - пустая строка,
# то будет возвращаться переменная user_word, которая ждет пользователький ввод
while user_word == nil || user_word == ""
  user_word = STDIN.gets.chomp
end

# Множественная проверка переменной user_word: в зависимости от значения переменной
# user_word будет выбрана одна из ветвей
case user_word
when "Бэтмен", "бэтмен", "БЭТМЕН", "batman", "Batman"
  puts "Джокер"
when "Шерлок Холмс", "шерлок холмс", "ШЕРЛОК ХОЛМС"
  puts "Профессор Мориарти"
when "Железный Человек", "железный человек", "ЖЕЛЕЗНЫЙ ЧЕЛОВЕК"
  puts "Капитан Америка!"
else
  puts "Не удалось найти героя!"
end





