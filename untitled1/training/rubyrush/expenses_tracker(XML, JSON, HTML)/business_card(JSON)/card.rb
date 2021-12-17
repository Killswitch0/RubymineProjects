# Подключаем библиотеку json
require 'json'

# Прочитаем визитку из файла и запишем ее в виде ассоциативного массива
file = File.read('card.json', encoding: 'utf-8')
business_card = JSON.parse(file)

# Выводим визитку в консоль используя в качестве переменных ключ-значение
business_card['business_card'].each do |key, line|
  puts "#{key}: #{line}"
end

puts

# Также мы можем записать нашу карту в виде ассоциативного массива
puts "#{business_card['business_card']['name']}"
puts "#{business_card['business_card']['skills']}"
puts "#{business_card['business_card']['number']}"
puts "#{business_card['business_card']['email']}"
