#Определим переменную veriable до объявления класса
veriable = 1

#Напишем класс, который проверяет наличие переменной в одном из своих методов
class Myclass
  def initialize
    @veriable = 1
  end

  def check_veriable
    puts "В классе:"
    puts "Переменная '@veriable': #{defined?(@veriable)}"
    puts "Переменная 'veriable': #{defined?(veriable)}'"
  end
end


obj = Myclass.new
obj.check_veriable

#Наконец убедимся, что переменные экземпляров недоступны вне методов класса
puts "\nВне класса:
Переменная '@veriable': #{defined?(@veriable)}
Переменная 'veriable': #{defined?(veriable)}"

