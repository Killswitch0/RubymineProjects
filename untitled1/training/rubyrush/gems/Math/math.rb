# Библиотека Math уже включена по умолчанию, поэтому нам нет нужны писать для
# её подключения дополнительный require. Методы и константы этой библиотеки
# доступны нам как методы и константы модуля Math.
#
# Получим значения чисел pi и e из модуля Math и запишем их в соответствующие
# переменные. Обратите внимание, что чтобы достать константу из модуля, нужно
# написать название модуля, два двоеточия и название константы.
pi = Math::PI
e = Math::E

# Выведем значения переменных pi и e на экран
puts "Число pi = #{pi}"
puts "Число e = #{e}"

# Выводим сумму синуса и косинуса числа pi с помощью методов sin и cos модуля
# Math. Обратите внимание, что методы у модуля вызываются также, как у
# эзкемпляра класса, через точку.
puts "Синус pi + косинус pi = #{(Math.sin(pi) + Math.cos(pi)).round(2)}"