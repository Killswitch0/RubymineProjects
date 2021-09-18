require_relative 'human'

puts "У нас есть 3 человека:"
human = Human.new("Максим", "Викторович", 25)
puts human.full_name

human1 = Human.new("Саша", "Артемович", 61)
puts human1.full_name

human2 = Human.new("Анна", "Михайловна", 21)
puts human2.full_name

