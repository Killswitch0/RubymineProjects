# Выводим приветствие для пользователя
puts "Привет, я твой дневник. Скажи мне что у тебя на уме и в душе?"
puts "Я сохраню всё, что ты напишешь до строчки \"end\" в файл."

# Определим папку, в которой лежит эта программа "my_diary.rb" с помощью
# специального служебного объекта Ruby __FILE__ и метода dirname класса File. В
# этой папке мы и будем хранить файлы дневника.
current_path = File.dirname(__FILE__)

# Объявим переменную line, которая будет содержать текущую введенную строку.
line = nil

# Объявим массив all_lines, сохраняющий все введенные пользователем строки
all_lines = []

# Запусаем цикл, в котором будем спрашивать у пользователя новую строку для
# дневника, пока он не введет "end". Помните, что строки чувствительны к
# регистру букв, поэтому введенная строка "END" не закончит ввод.
while line != "end"
  # Читаем очередную строку от пользователя
  line = STDIN.gets.chomp
  # И записываем её в массив
  all_lines << line
end

# Перед сохранением файла, определим текущее время
time = Time.now

# Составим имя файла, в зависимости от текущей даты, используя метод strftime,
# который формирует строку типа 2021_12_27. Для этого применаются специальные
# ключи % — набор возможных ключей см. в документации.
#
# http://www.ruby-doc.org/core-2.0/Time.html#method-i-strftime
file_name = time.strftime("%Y-%m-%d") # 2021-09-01

# Таким же способом, но с помощью других ключей составим с помощью объекта time
# текущее время, чтобы написать в дневнике, когда была сделана запись, в виде
# строки "19:37".
time_string = time.strftime("%H:%M") # 17:14

# Строка-разеделитель для записей
separator = "_______________________"

# Создаем новый файл в режиме append, т. е. если файл не существует, он будет
# создан заново, если существует — он будет открыт для записи в конец файла.
file = File.new(current_path + "/" + file_name + ".txt", "a:UTF-8")

# Сперва запишем в дневник время этой записи методом print экземпляра класса
# File. Добавим символы переноса строки "\n" ("\r" – специальный дополнительный
# символ конца строки для Windows, на Mac OS X или
# Linux, их не нужно писать).
file.print("\n\r" + time_string + "\n\r")

# Теперь удалим последний элемент из массива all_lines — ведь там служебное
# слово "end" — с помощью метода массива pop
#
# http://www.ruby-doc.org/core-2.0/Array.html#method-i-pop
all_lines.pop

# В цикле запишем строчку за строчкой наш массив в файл дневника
all_lines.each do |item|
  file.puts(item)
end

# В конце записи поставим разделитель
file.puts(separator)

# Обязательно нужно закрыть файл, чтобы сохранить все изменения
file.close

# Оповестим пользователя, что запись сохранена!
puts "Ваша запись сохранена в файл #{file_name}.txt"