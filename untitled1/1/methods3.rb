def division_2(name = '', age = nil, weight = 71)
  var = 'Hello '

  if name != 'Dasha' && age == nil
    var += 'World'
  end

  return var
end

puts division_2(name = 'Masha')
puts division_2(name = 'Pasha', age = 25)
puts division_2(name = 'Sasha', age = 35, weight = 70)
