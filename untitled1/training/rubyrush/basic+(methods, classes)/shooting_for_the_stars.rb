
def shooting_for_the_stars(n_stars)

  count = 0
  while count < n_stars
    print "*"
    count += 1
  end

end


puts "Сколько вам звезд на погоны?"
numb_of_stars = gets.to_i


puts "\nВот ваши погоны:"
puts shooting_for_the_stars(numb_of_stars)



p '_________'


def print_stars(n)

  result_string = ''

  while result_string.length < n
    result_string += '*'
  end

  result_string
end


puts 'Сколько вам звезд на погоны?'
user_n = gets.to_i

puts "\nВот ваши погоны:"
puts print_stars(user_n)

