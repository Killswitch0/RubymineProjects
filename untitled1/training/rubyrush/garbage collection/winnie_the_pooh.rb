def count_honey_pots
  honeypots = []

  5000000.times do |i|
    honeypots << "honey pot # #{i}"
  end
end

puts "Winnie the pooh is trying to sleep"

count_honey_pots

GC.start

gets