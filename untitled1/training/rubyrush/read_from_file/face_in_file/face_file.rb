# Определим папку, в которой лежит эта программа "face_file.rb" с помощью
# специального служебного объекта Ruby __FILE__ и метода dirname класса File. В
# этой папке мы и будем хранить файлы дневника.
current_path = File.dirname(__FILE__ )

# Заведем четыре переменные с путями к файлам с набором для каждого фрагмента.
# Обратите внимание, что файлы с набором фрагментов нужно создавать в папке data1,
# которая находится в той же папке, где вы запускаете программу.
file_path1 = "./data1/forehead.txt"
file_path2 = "./data1/eyes.txt"
file_path3 = "./data1/nose.txt"
file_path4 = "./data1/mouth.txt"

# Проверяем, есть ли файл со лбами
if File.exist?(file_path1)

  # Если есть - открываем файл
  file = File.new(file_path1)

  # Считываем все его строки в массив
  forehead = file.readlines
  file.close # Обязательно закрываем файл, как сделаем все необходимые действия
else
  puts "[ Файл не найден ]" #если файл не найден - сообщаем об этом об этом
end

# Аналогично с остальными частями лица
if File.exist?(file_path2)
  file = File.new(file_path2)
  eyes = file.readlines
  file.close
else
  puts "[ Файл не найден ]"
end

if File.exist?(file_path3)
  file = File.new(file_path3)
  nose = file.readlines
  file.close
else
  puts "[ Файл не найден ]"
end

if File.exist?(file_path4)
  file = File.new(file_path4)
  mouth = file.readlines
  file.close
else
  puts "[ Файл не найден ]"
end

# Создаём переменную с уникальным именем файла
time = Time.now
# Обратите внимание, что в названии файла не должно быть пробелов - они должны быть заменены
# на нижнее подчеркивание _
file_name = "face_" + time.strftime("%Y.%m.%d_%H-%M-%S") + ".txt"

# Открываем файл для записи
file1 = File.new(current_path + "/" + file_name, "w:UTF-8")

# Пишем уникальную рожицу в файл
file1.puts(forehead.sample)
file1.puts(eyes.sample)
file1.puts(nose.sample)
file1.puts(mouth.sample)

# Закрываем файл
file1.close

# Если код дошел до этой строчки - все прошло успешно. Сообщаем об этом!
puts "Файл #{file_name} успешно создан!"