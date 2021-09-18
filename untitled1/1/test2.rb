def division_5(name, age)
  puts 'My name is ' + name
  puts 'My age is '  + age.to_s
  puts '____'
end

division_5(name = 'Maximus', age = 25)
division_5(name = 'Igor', age = 50)

def division
  puts 'My penis is big'
end

division

puts '____'


def division_7(name = '', age = nil)
  var = 'Hello '

  if name != 'Dasha' && age == nil
    var += 'World'
  end

  return var
end

division_7(name = 'Max')


