
array = []

puts 'Какой длинны должен быть массив?'
user_choice = gets.to_i


while array.size < user_choice
  rand_n = rand(0..100)
  array << rand_n
end

max_value = 0

for item in array
  if item > max_value
    max_value = item
  end
end

p array
puts "Самый большой элемент массива: #{max_value}"



