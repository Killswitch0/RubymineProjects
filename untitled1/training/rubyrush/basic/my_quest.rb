


puts "Добро пожаловать в нашу игру. Правила просты: \"читать текст, отвечать на вопросы\" "
sleep(2)
puts ''
choice = nil
until choice == 1 || choice == 2 do
puts "Шли ребята по улице, увидели стоящего у них на пути человека. Подходят к нему чуть ли не в упор, а мужчина
не сдвигается. Что делать?
1. Спросить, что он тут делает?
22. Толкнуть человека, громко прокричав: \"с дороги!\""
choice = gets.to_i
end





if choice == 1
  puts "Человек молчит, таинственно глядя в сторону."
  sleep(1)
  puts "Оно, оно.... близко, оно..."
  sleep(1)
  puts "Оно смотрит на вас...Видит вас... Знает!"
  sleep(1)
  puts ""
  choice = nil
  until choice == 1 || choice == 2 || choice == 3
  puts "Мужик поник..
1. Ебануть ему пощечену - оклиматься должен.
22. Драпу давать, куда глаза глядят
3. Введите \"cheat\", чтобы достать перчатку Таноса и превратить человека в зайчика"
  choice = gets.to_i
  end
  if choice == 1
    puts "ААААААААА! - ЗАКРИЧАЛ ДЕД"
    sleep(1)
    puts "ЧТО ЭТО?КТО ЭТО?"
    puts ""
    puts "ВЫЫЫЫЫЫЫЫ. Смерти хотите????? Я могу убить тебя так быстро, что очко сжаться не успеет!"
    elsif choice == 2
    puts "БЕЖИИИИИИМ"
    sleep(1)
    puts "Ребята только начали разворачиваться на 180 градусов, как человек издал страшный крик"
    elsif choice == "cheat"
      abort "превратись в кролика, торчок!"
  end
  end



choice = nil
until choice == 1 || choice == 2
puts "Один из парней в шоке, чуть не потерял сознание, еле справляясь с дрожью в ногах, отходит назад от человека,
медленно перешагивая с ноги на ногу. Понимая, что деваться некуда, задает вопрос человеку:
   1. Что ты такое?
   22. Прости, человек, я не хотел тебя разозлить!"
choice = gets.to_i
end




if  choice == 1
  puts "Я пришел сюда лишь за одним - хотел покоя, умиротворения, того самого слияния с бесконечно-вечным... "
  sleep(2)
  puts "Что вы, собственно, нарушили!!!!!ПОКОЙ!!!!! АААААААРААРАРАХ - откусил голову второму парню..."
  elsif choice ==  2
  puts "Одним прости не отделаешься!"
  puts "На колени... - сказал человек, расстегивая ширинку."
  choice = nil
  until choice == 1 || choice == 2 do
  puts "Человек сошел с ума, мне ничего не остается, кроме обороны.Надо думать!
1. Взять кирпич, ударить человека
22. Взять в рот член, а затем откусить его
3. Выкрутить яца"
  choice = gets.to_i
  end

  if choice == 1
    puts "Бью человека кирпичем по голову, он почти потерял сознание, но быстро оклемался и открыл огромный роооот..."
  elsif choice == 2
    puts "Парень берет хуй в рот, откусывает у мужика член, сжимает яцца, вырывая их с корнями! Человек умирает от шока,
не успевая открыть большой рот"
  elsif choice == 3
    puts "Выкручиваю яйца человеку, он корчится от боли, подобрал момент, захожу за спину и говорю ему, что он лох.
Человек не справляется с эмоциональной нагрузкой, начинает плакать и просить прощение..."
  end
  end






