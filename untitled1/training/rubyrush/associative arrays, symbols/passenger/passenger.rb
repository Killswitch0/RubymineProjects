passenger = {
  ticket_number: '№ РМ2010398 050298',
  first_name: 'Maxi',
  second_name: 'Laxi',
  passport_number: "434 35355 664646",
  departure_city: 'Харьков',
  destination_city: 'Москва'
}

puts "Билет #{passenger[:ticket_number]}"
puts "Маршрут: #{passenger[:departure_city]} --> #{passenger[:destination_city]}"
puts "Пассажир: #{passenger[:first_name]} #{passenger[:second_name]}"
puts "Паспорт: #{passenger[:passport_number]}"