# Подключим встроенный в руби класс Date для работы с датами
require 'date'

# Класс «Задача», разновидность базового класса «Запись»
class Task < Post

  # Конструктор у класса «Задача» свой, но использует конструктор родителя.
  def initialize
    # Вызываем конструктор родителя
    super

    # Создаем специфичную для ссылки переменную экземпляра @due_date — время, к
    # которому задачу нужно выполнить
    @due_date = Time.now
  end

  # Напишем реализацию метода read_from_console для экземпляра задачи. Он
  # спрашивает у пользователя текст задачи (что нужно сделать) и дату, до
  # которой нужно успеть это сделать.
  def read_from_console

    # Спросим у пользователя, что нужно сделать и запишем его ответ (строку) в
    # переменную экземпляра класса Задача @text.
    puts "Что надо сделать?"
    @text = STDIN.gets.chomp

    # Спросим у пользователя, до какого числа ему нужно выполнить задачу и
    # подскажем формат, в котором нужно вводить дату. А потом запишем его ответ
    # в локальную переменную input.
    puts "К какому числу? Укажите дату в формате ДД.ММ.ГГГГ, например 24.02.1996"
    input = STDIN.gets.chomp

    # Для того, чтобы из строки получить объект класса Date, с которым очень
    # удобно работать (например, можно вычислить, сколько осталось дней до
    # нужной даты), мы получим этот объект из строки с помощью метода класса
    # Date (статического метода).
    @due_date = Date.parse(input)
  end

  # Метод to_string должен вернуть все строки, которые мы хотим записать в
  # файл при записи нашей задачи: строку с дедлайном, описание задачи и дату
  # создания задачи.
  def to_strings
    time_string = "Создано #{@created_at.strftime("%Y.%m.%d, %H:%M:%S")} \n\r \n\r"
    deadline = "Крайний срок: #{@due_date}"
    [deadline, @text, time_string]
  end

  def to_db_hash
    super.merge(
      {
        'text' => @text,
        'due_date' => @due_date.to_s
      }
    )
  end
end