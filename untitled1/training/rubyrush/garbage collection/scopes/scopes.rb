def veriable
  c = 25

  # Посмотрим, какие переменные определены внутри метода
  puts "Переменная '$a': #{defined?($a)}"
  puts "Переменная 'b': #{defined?(b)}"
  puts "Переменная 'c': #{defined?(c)}"
end

$a = 1
b = 25

veriable

# Посмотрим, какие переменные определены снаружи метода
puts "Переменная '$a': #{defined?($a)}"
puts "Переменная 'b': #{defined?(b)}"
puts "Переменная 'c': #{defined?(c)}"

