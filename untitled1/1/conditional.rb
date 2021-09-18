if 2 < 1
  puts 'yes'
else
  puts 'no'
end

puts 'yes' unless 2 < 1
puts 'yes' if 2 < 1


name = 'Masha'

if name == 'Dasha'
  puts 'My name is ' + name
elsif name == 'Pasha'
  puts 'My name is ' + name
elsif name == 'Masha'
  puts 'My name is ' + name
end

if name == 'Masha' || 1 < 2 && name != 'Dasha'
  puts 'My name is ' + name
end

if name == 'Masha' && 120 < 150
  puts 'My name is ' + name
end

if name == 'Masha' || 11 < 13
  puts 'My name is ' + name
end