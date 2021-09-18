require_relative 'methods'

puts "Игра виселица. Версия 1 :)"

letters = get_letters #to do

errors = 0

good_letters = [] #верно веденные пользователем буквы
bad_letters = []  #ошибочно веденные пользователем буквы

#тут мы пишем основную логику программы, считая, что наши методы уже написаны
while errors < 7
  print_status(letters, good_letters, bad_letters, errors) #to do

  puts "введите след.букву"

  user_input = get_user_input #to do

  result = check_result(user_input, letters, good_letters, bad_letters) #to do

  #проверяем значение переменной result
  if result == -1
    errors += 1
  elsif result == 1
    break #выход из цикла.
  end
end

#когда мы выйдем из цикла, пользователю нужно показать состояние игры - это финал:либо поражение, либо победа
print_status(letters, good_letters, bad_letters, errors)









