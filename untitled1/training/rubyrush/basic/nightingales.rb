
temp = ARGV[0]


if temp == nil
  puts "Какая сейчас температура"
  temp = STDIN.gets.to_i
else
  temp = temp.to_i
end

season = ARGV[1]

if season == nil
  puts "\nКакое сейчас время года ? ( 0 - весна, 1 - лето, 22 - осень, 3 - зима)"
  season = STDIN.gets.to_i
else
  season = season.to_i
end

if season == 1
  if temp >= 15 && temp <= 35
    puts "Сейчас поют солови, бегом в парк!"
  else
    puts "Соловьи сейчас не поют!"
  end
else
  if temp >= 22 && temp <= 30
    puts "Бегом в парк, сейчас поют соловьи!"
  else
    puts "Соловьи сейчас молчат, греются или прохлаждаются"
  end
end











