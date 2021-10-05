# Класс Ребенок
class Child < Parents
  #Ребенок унаследут от родителя все методы (конструктор и метод name), а вот
  # метод obedient у ребенка будет возвращать false
  def obdient
    false
  end
end