#Создал класс Chameleon принимает в себя только один метод change_color(с параметром color)
class Chameleon

  def change_color(color)
    puts "Теперь я " + color
  end

end

#с помощью оператора . и метода new(вместе .new) мы создали экземпляр класса Chameleon
chameleon = Chameleon.new

#применяем метод экземпляра класса с параметром метода, который указываем сами
chameleon.change_color("красный")
chameleon.change_color("оранжевый")
chameleon.change_color("фиолетовый")