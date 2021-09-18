
def cut_n_element(n, array)
  cut_n = %w[]

  count = 0

  while count < n
    if array.size <= count
      break
    end

    if count <= n
      cut_n << array[count]
      count += 1
    end
  end

  return cut_n
end

array = %w[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15]
puts "Вот такая колбаса у нас есть:"
puts array.to_s


puts "\nСколько первых элементов вам отрезать?"
user_choice = gets.to_i



puts "Вот новый кусок колбасы:"
puts cut_n_element(user_choice, array).to_s











