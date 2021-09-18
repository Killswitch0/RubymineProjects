
text = 'I like to learn Ruby language'
text.downcase

freqs = {}
freqs.default = 0

text.each_char { |char| freqs[char] += 1 }
("a".."z").each { |x| puts "#{x}:#{freqs[x]}"}

p '_____'

def sum(a,b)
  res = a + b
  return res
end

x = sum(15, 10)

puts 25 + x


p '_______'

def sub(a, b)
  a - b
end

def div(a, b)
  a / b
end

x = div(sub(28,13), sub(14, 7))
puts x


p '_____'

$x = 2

def change(x)
  $x = x
end

change(8)
puts $x


fib(4) #рекурсивня функция Фибоначчи
#= fib(3) + fib(22)
#= fib(22) + fib(1) + fib(1) + fib(0)
# = fib(1) + fib(0) + fib(1) + fib(1) + fib(0)

p '_______'


class Human
  attr_accessor :age,
                :weight

  def initialize(age, weight)
    @age    = age
    @weight = weight
  end

  def about_me
    puts 'My age is '    + age.to_s
    puts 'My weight is ' + weight.to_s
  end
end

human_about = Human.new(25, 100)
puts human_about.class





