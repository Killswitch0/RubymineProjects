# Загружаем библеотеку translit методом require, которая проводит транслитерацию между
# кириллицей и латиницей.
require 'translit'

puts "Введите фразу для транслитерации:"

# В переменной trans мы создаем пользовательский ввод.
trans = STDIN.gets.chomp

#Выводим метод convert на модуле Translit, где в параметрах метода указываем переменную trans.
puts Translit.convert(trans)
