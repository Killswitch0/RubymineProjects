class Person
  def initialize(first_name, middle_name)
    @first_name = first_name
    @middle_name = middle_name
    # Объявим переменную, где хранится любимый фильм, пока там пусто
    @lovely_film = nil
  end

  def full_name
    puts "#{@first_name} #{@middle_name}"
  end

  # Это сеттер — метод, который мы будем использовать для записывания фильма
  # в экземпляр класса Person.
  #
  # Обратите внимание на знак «=» в конце названия метода. Это позволяет вызвать
  # этот метод с оператором присваивания. Если мы объявим такой метод у класса
  # Person, то в основной программе сможем написать
  #
  # person = Person.new(...)
  # person.film = Film.new(...)
  #
  # Это удобно и наглядно
  def film=(film)
    @lovely_film = film
  end

  # Классический аксессор для переменной экземпляра @film
  def film
    @lovely_film
  end


end