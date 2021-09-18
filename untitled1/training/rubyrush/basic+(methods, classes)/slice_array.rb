

def cut_n_elements_2(number, array)
  new_array = %w[]

  counter = 0

  while counter < number
    if array.size <= counter
      break
    end

    new_array << array[counter]
    counter += 1
  end

  return new_array
end

original_array = %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]

puts "Вот такая палка у нас есть:"
puts original_array.to_s

puts "Сколько первых элементов вам отрезать?"
number = gets.to_i



puts "Вот ваша новая колбаса:"
puts cut_n_elements_2(number, original_array).to_s