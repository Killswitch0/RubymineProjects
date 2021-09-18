require_relative 'budybuilder'

puts "Первый бодибилдер"
body = Bodybuilder.new

5.times do
  body.build_muscle('biceps')
end

7.times do
  body.build_muscle('tryceps')
end

10.times do
  body.build_muscle('delts')
end

puts body.bodybuilder_size





puts "Второй бодибилдер:"
body2 = Bodybuilder.new

7.times do
  body2.build_muscle('biceps')
end

6.times do
  body2.build_muscle('tryceps')
end

9.times do
  body2.build_muscle('delts')
end

puts body2.bodybuilder_size


