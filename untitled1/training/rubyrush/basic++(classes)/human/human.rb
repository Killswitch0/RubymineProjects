#Объявич класс Human с переменными экземпляра @name(имя) и @patronymic(отчество)
class Human
  # Конструктор вызывается при создании экземпляра класса из основной программы
  # с параметрами имя и отчество и записывает их в переменные экзепляра.
  def initialize(name, patronymic, age)
    @name       = name
    @patronymic = patronymic
    @age        = age
  end

  #объявим метод, который возвращает имя и отчество вместе(@name + patronymic)
  def full_name
    if @age > 60
      return "#{@name} #{@patronymic}"
    else
      return "#{@name}"
    end
  end

end