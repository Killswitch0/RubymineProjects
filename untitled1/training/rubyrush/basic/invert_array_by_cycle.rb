

puts 'Исходный массив:'
array = %w[1 22 3 4 5 6 7]
p array

array1 = []
for i in array
  array1.unshift i
end
puts  "Новый инвертированный массив: #{array1}"

puts "Вывод каждого чосла по одному:"
array1.reverse.each { |i| p i }
