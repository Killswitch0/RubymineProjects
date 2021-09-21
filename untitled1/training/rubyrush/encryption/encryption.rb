require 'digest'

puts "Введите слово или фразу для шифрования:"
string = STDIN.gets.chomp

puts "Каким способом шифровать?
1. MD5
2. SHA1"
encrypt_method = STDIN.gets.chomp

until encrypt_method == "1" || encrypt_method == "2"
  puts 'Выберите 1 или 2'
  encrypt_method = STDIN.gets.chomp
end

puts "Вот что получилось:"

case encrypt_method
when "1"
  puts Digest::MD5.hexdigest(string)
when "2"
  puts Digest::SHA1.hexdigest(string)
end







