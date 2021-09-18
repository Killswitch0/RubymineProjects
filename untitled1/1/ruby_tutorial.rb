class RubyTutorial

  def self.description
    a,b,c = 1,2,3
    p a ? b : c

    for i in 0..5
      p i
    end

    for i in 0...5
      p i
    end

    p '_______'

    array = %w[Sasha Masha Dasha]
    array.map { |i| p i }
    array.map(&method(:p))
    array.each(&method(:p))

    p 1.class
    p 'Max'.class
    p false.class
    p nil.class
    p '_____'

    p 1.to_f
    p 1.to_s
    p 1.to_i
    p '______'

    p rand(1..10)
    p rand(1...10)

    p '_____'

    p 'Max'.downcase
    p 'max'.upcase
    p 'sa da ma za'.capitalize

    string = 'sasha masha'
    p string.chars
    p '_____'

    p string.split
    p '_____'

    array2 = %w[Sasha Masha Dasha]
    p array2.find_index("Sasha")
    p '_____'

    array = [1, 2, 3, 4]
    array.find_all { |num| p num.odd? } #возвращает true, если число нечетное
    p '______'
    array.find_all { |num| p true }
    p '______'
    array.find { |num| p num.even?} #возвращает true,если число четное
    p '______'
    array.map { |str| p str.to_s.length }

    p '______'

    hash = { car: 'audi', name: 'a8', engine: 'v12' }
    p hash.reverse_each.to_h

    p '_____'

    [["audi", "black", 2008], ["bmw", "red", 2014]].each do |make, color, year|
      puts "car: #{make}, color: #{color}, year: #{year}"
    end

    p '______'
    hash = { car: 'audi', name: 'a8', engine: 'v12' }
    p hash.empty?
    p hash.size
    p hash.keys
    p hash.include? :car #содержит ли hash данный key
    p hash.sort #сортирует hash [[:car, "audi"], [:engine, "v12"], [:name, "a8"]]







  end
end

RubyTutorial.description

