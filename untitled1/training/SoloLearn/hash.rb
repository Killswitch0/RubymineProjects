hash = {
  human: {name: 'Max',            age: 25,    color: 'blue'},
    car: {name: 'Mercedes',    weight: 1900,  power: 2500},
    fly: {name: 'Raptor',      weight: 4500,  power: 10000}
}


hash.each { |key, val| puts "#{key}:#{val}" }

p '____________'

text = 'I like to learn Ruby language, cause its great fun!'

text.downcase

freqs = {}
freqs.default = 0

text.each_char { |char| freqs[char] += 1 }

("a".."z").each { |x| puts "#{x}:#{freqs[x]}" }








