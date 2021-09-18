numbers = []
puts 'Введите число: '
user_n = gets.to_i

index = 1
sum = 0

while index <= user_n
  numbers << index
  sum += index
  index += 1
end

p numbers
p sum

