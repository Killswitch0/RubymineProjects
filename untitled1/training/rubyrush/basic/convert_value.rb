
puts "Какая у вас на руках валюта?
1. Доллары
2. Гривны"

choice = gets.chomp

if choice == "1"
  puts 'Сколько стоит 1 доллар?'
  usd_rate = gets.to_i
  puts 'Сколько у тебя долларов?'
  my_money = gets.to_i

  grn = my_money * usd_rate

  puts 'Курс доллара к грине равен: ' + grn.to_s + "грн"
else
  puts "[ В качестве разделительного знака используйте \".\" ]
  Сколько стоит стоит одна гривна?"
  grn_rate = gets.to_f

  puts "Сколько у тебя гривен?"
  my_money = gets.to_f

  usd = my_money * grn_rate
  puts 'Курс гривны к доллару равен: ' + usd.to_s + "$"
end


