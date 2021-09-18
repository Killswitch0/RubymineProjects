

def division(name = '', age = nil)
  var = 'Hello '

  if name != 'Dasha' && age == nil
    var += 'World'
  end
  return var
end

puts division(name = 'Max')

