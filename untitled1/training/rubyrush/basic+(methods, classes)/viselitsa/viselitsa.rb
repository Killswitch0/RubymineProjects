require_relative 'methods'

puts 'Игра виселица! Версия 1.'

letters = get_letters #to do

errors = 0

bad_letters = []
good_letters = []

while errors < 7
  print_status(letters, good_letters, bad_letters, errors) #to do

  puts "введите след. букву"

  user_input = get_user_input #to do

  result = check_result(user_input, letters, good_letters, bad_letters) #to do

  if result == -1
    errors += 1
  elsif result == 1
    break
  end
end

print_status(letters, good_letters, bad_letters, errors)

