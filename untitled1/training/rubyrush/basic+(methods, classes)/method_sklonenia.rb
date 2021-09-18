
def sklonenia(number, krokodil, krokodila, krokodilov)

  if number == nil || !number.is_a?(Numeric)
    number = 0
  end

  ostatok100 = number % 100

  if ostatok100 >= 11 && ostatok100 <= 14
    return krokodilov
  end


  ostatok = number % 10

  if ostatok == 1
    return krokodil
  end

  if ostatok > 1 && ostatok <= 4
    return krokodila
  end

  if ostatok > 4 || ostatok == 0
    return krokodilov
  end
end

number = ARGV[0].to_i

puts "#{number} " +
       sklonenia(number, "негритёнок", "негритёнка", "негритят" ) + " " +
       sklonenia(number, "пошел", "пошли", "пошли") +
       " купаться в море."