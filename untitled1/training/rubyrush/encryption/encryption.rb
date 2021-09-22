# Подключаем встроенную в ruby библиотеку с модулем Digest
#
# https://ruby-doc.org/stdlib-2.4.0/libdoc/digest/rdoc/Digest.html
require 'digest'

# Запрашиваем у пользователя строку и записываем её в переменную string
puts "Введите слово или фразу для шифрования:"
string = STDIN.gets.chomp

# Запрашиваем у пользователя метод шифрования
puts "Каким способом шифровать?
1. MD5
2. SHA1"
encrypt_method = STDIN.gets.chomp

until encrypt_method == "1" || encrypt_method == "2"
  puts 'Выберите 1 или 2'
  encrypt_method = STDIN.gets.chomp
end

puts "Вот что получилось:"

# Выводим зашифрованную строку в зависимости от выбора пользователя
case encrypt_method
when "1"
  puts Digest::MD5.hexdigest(string)
when "2"
  puts Digest::SHA1.hexdigest(string)
end







