arr = %w[dasha masha sasha]
arr1 = %w[lena gena elena]

arr_all = arr + arr1

p arr_all

p '_____'

arr = %w[1 22 3 4 5]
p arr
p arr.reverse #выводим массив в обратном порядке, не изменяя его
p arr.reverse! #переворачиваем массив вверх ногами, изменяя его
p arr #изменения можно наглядно посмотреть, если вывести массив

p '____'

cars = %w[
 zaz
 lada
 renault
 honda
 toyota
 hummer
 ford
 audi
 corvette
 lamborghini
]

puts 'У нас есть ' + cars.size.to_s + ' машин. Вам какую?'
choice = gets.to_i-1

if choice >= 0 && choice < cars.size
  puts 'Поздравляю, вы получаете автомобиль: ' + cars[choice]
else
  puts 'У нас есть всего 10 автомобилей. Вам какой?'
end

p '____________'


girls = %w[
Kris
Lena
Anna
Julia
Viktoria
]

puts "У нас есть #{girls.size} девушек. Выбери номер девушки, которую ты хочешь!"

choice = gets.to_i-1

if choice >= 0 && choice < girls.size
  puts 'Поздравляю, твоя девушка: ' + girls[choice]
else
  puts 'У нас есть всего 5 девушек. Тебе какую?'
end

p '_____'











