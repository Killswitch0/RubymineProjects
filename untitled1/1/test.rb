puts "1" + '22'
puts 1+2

name = 'Max'
position = 'Top'
puts 'My name is ' + name + '. My status is ' + position

name = 'Maximka'
add = 1 + 3
mult = 2 * 3
sub = 5 - 3
div = 10 / 2

puts name
puts add
puts mult
puts sub
puts div

eq_1 = 2 < 3
eq_2 = 3 <= 3
eq_3 = 3 < 3

puts eq_1
puts eq_2
puts eq_3

puts '______'


puts (1 < 2) && (1 < 3)
puts (1 > 2) || (2 == 2) && (2 < 1)
puts (1 > 2) || (2 > 1) && (2 == 2)

puts '_____'

name = 'Jack'

if name == 'Jack'
  puts ' My name is ' + name
else
  puts 'Fuck off. You are fucking bullshit, man.'
end

if name == 'James' || 150 > 200
  puts 'My name is ' + name
elsif name == 'Jack'
  puts 'No. I am not James. I am ' + name
end

x = 1

if x > 2
  puts 'x is greater than 22'
elsif x < 2
  puts 'x less than 22'
end

if name == 'Jack'
  puts 'I am not ' + name
elsif name == 'James'
  puts 'My name is ' + name
end



def division_1
  puts 'I am crazy'
end


def division_2(name, age)
  puts 'My name is ' + name
  puts 'My age is ' + age.to_s
end


def division
  division_1
  division_2(name = 'Max', age = 25)
end

division


puts '____________'

def division_5(name)
  puts 'My name is ' + name
  puts 'My age is ' +  age.to_s
end

division_5(name = 'Maximus')
division_5(age = 25)




