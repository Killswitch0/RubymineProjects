class Human
  attr_accessor :age,
                :weight

  def initialize(options = {})
    @age    = options[:age]
    @weight = options[:weight]
  end

  def about_me
    puts 'My age is '    + age.to_s
    puts 'My weight is ' + weight.to_s
  end

  def count
    if weight == 100
      puts 'You are so big BOY!!!'
    else
      puts 'You are big BOY'
    end
  end

  def test
    if age == 25 && weight == 100
      puts 'OHHH YEAH, TEST IS WELL DONE'
    else
      'Why?'
    end
  end
end

human  = Human.new({age: 25, weight: 100})

puts human.test


p '_______'

class X

end

x = X.new
puts "Object data1: #{x}" #таким образом мы включили объект "x" в вывод.


