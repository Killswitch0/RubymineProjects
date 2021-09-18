# В отдельном файле bridge.rb объявляем класс Bridge (Мост)
#
# Обратите внимание, название файла всегда совпадает с названием класса,
# только пишется маленькими буквами.
#
# Если в названии класса два слова: BigBridge, то в названии файла эти слова
# разделяются подчеркиванием: big_bridge.rb.
#
# Везде, где мы подключим файл bridge.rb мы сможем создавать объекты класса
# Bridge и пользоваться их методами
class Bridge
  # Специальный метод initialize в руби играет роль конструктора класса он
  # вызывается при создании объекта данного класса, когда пишем Bridge.new.
  def initialize
    puts "Мост создан"
    # И создадим переменную экземпляра класса @opened. Обратите внимание, что
    # переменные экземпляра объявляются и используются только в методах класса.
    # Перед их названием стоит символ @.
    #
    # Все необходимые поля класса, которые объект класса будет использовать в
    # своих методах нужно объявлять и задавать в конструкторе, присваивая им
    # их начальные значения.
    #
    # Начальное значение переменной @opened у нас будет false.
    @opened = false
  end

  # Объявим метод open свой метод, который будет открывать наш мост
  def open
    puts "Мост открыт, можно ехать!"
    # Меняем состояние объекта (а конкретно, переменной @opened)
    @opened = true
  end

  # Объявим метод is_opened? который будет возвращать true, если мост открыт
  # и false, если закрыт. По соглашению, на конце методов, которые возвращают
  # true или false должен быть знак вопроса.
  def is_opened?
    return @opened
  end

end