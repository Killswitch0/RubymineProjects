if rand(0..6) == 5
  puts 'монета встала на ребро'
else
  if rand(0..2) == 1
    puts 'выпала решка'
  else
    puts 'выпал орел'
  end
end