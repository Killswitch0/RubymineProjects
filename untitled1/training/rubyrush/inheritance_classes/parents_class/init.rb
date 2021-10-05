# Подключаем классы Parents и Child
require_relative 'parents'
require_relative 'child'

# Создаем родителя
parent = Parents.new("Владимир")

# Создаем ребенка
child = Child.new("Викусичка")

# Проверяем, кто послушный, а кто нет
puts "#{parent.name} послушный: #{parent.obdient}"
puts "#{child.name} послушный: #{child.obdient}"
