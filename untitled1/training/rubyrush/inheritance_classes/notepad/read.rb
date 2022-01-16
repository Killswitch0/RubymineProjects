# Подключаем класс Post и его детей
require_relative 'post.rb'
require_relative 'memo.rb'
require_relative 'link.rb'
require_relative 'task.rb'

# будем обрабатывать параметры командной строки по-взрослому с помощью спец. библиотеки руби
require 'optparse'

# Все наши опции будут записаны сюда
options = {}
# заведем нужные нам опции
OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Prints this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'какой тип постов показывать (по умолчанию любой)') { |o| options[:type] = o } #
  opt.on('--id POST_ID', 'если задан id — показываем подробно только этот пост') { |o| options[:id] = o } #
  opt.on('--limit NUMBER', 'сколько последних постов показать (по умолчанию все)') { |o| options[:limit] = o } #

end.parse!

result = if options[:id].nil?
           # если id не передали, ищем все записи по параметрам
           Post.find_all(options[:limit], options[:type])
         else
           # если передали - ищем только по id
           Post.find_by_id(options[:id])
         end

if result.is_a? Post # показываем конкретный пост
  puts "Запись #{result.class.name}, id = #{options[:id]}"
  # выведем весь пост на экран и закроемся
  result.to_strings.each { |line| puts line }

else # показываем таблицу результатов

  print "| id\t| @type\t|  @created_at\t\t\t|  @text \t\t\t| @url\t\t\t| @due_date \t "

  result.each do |row|
    puts
    # puts '_'*80
    row.each do |element|
      print "|  #{element.to_s.delete("\\n\\r")[0..40]}\t"
    end
  end
end

puts

# Фигурные скобки {...} после вызова метода в простых случаях аналогичны конструкции do ... end
# Они ограничивают блок кода который будет выполняться этим методом
#
# см. http://stackoverflow.com/questions/5587264/do-end-vs-curly-braces-for-blocks-in-ruby