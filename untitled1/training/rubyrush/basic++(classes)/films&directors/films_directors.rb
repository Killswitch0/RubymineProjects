#Создаем класс Film
class Film

  # Конструктор принимает на вход два параметра: название фильма и фамилия
  # режиссера. Значения этих параметров сохраняем в переменных @title и
  # @director экземпляра класса соответственно.
  def initialize(films, director)
    @films = films
    @director = director
  end

  # Два метода-аксессора (геттера), возвращающих название фильма и режиссера
  def title
    @films
  end

  def director_name
    @director
  end

end