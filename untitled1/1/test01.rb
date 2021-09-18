
i = 25

while i < 50
  i += 1
  puts 'i am ' + i.to_s
end



def division_7(name = '', age = nil)
  var = 'Hello '

  if name != 'Dasha' && age == nil
    var += 'World'
  end

  return var
end

puts division_7(name = 'Max')