class Bodybuilder

  #исходный статус мышц бодибилдера равен 0, поскольку мы еще их не качали
  def initialize
    @biceps  = 0
    @tryceps = 0
    @delts   = 0
  end

  #увеличиваем мышцы в зависимости от типа, который мы указываем в параметре muscles: biceps/tryceps/delts
  def build_muscle(musclses)
    if musclses == 'biceps'
      @biceps += 1
    end

    if musclses == 'tryceps'
      @tryceps += 1
    end

    if musclses == 'delts'
      @delts += 1
    end
  end

  #Выводим на экран размер наших мышцы, которые хранятся в переменных экземпляра класса
  def bodybuilder_size
    puts "бицепс: #{@biceps}"
    puts "трицепс: #{@tryceps}"
    puts "дельты: #{@delts}\n"
  end
end


