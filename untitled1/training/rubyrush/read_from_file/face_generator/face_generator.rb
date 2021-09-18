# Программа-фоторобот, которая «собирает» лицо из фрагментов.

# Заведем четыре переменные с путями к файлам с набором для каждого фрагмента.
# Обратите внимание, что файлы с набором фрагментов нужно создавать папке data,
# которая находится в той же папке, где вы запускаете программу.
file_path1 = './data1/forehead.txt'
file_path2 = './data1/eyes.txt'
file_path3 = './data1/nose.txt'
file_path4 = './data1/mouth.txt'

# Проверяем, есть ли файл со лбами
if File.exist?(file_path1)

  # Если есть - открываем файл
  file1 = File.new(file_path1)

  # Считываем все его строки в массив
  forehead = file1.readlines
  file1.close
else
  # Если не найдет, сообщаем об этом пользователю и выходим с ошибкой
  puts "Файл не найден"
end

# Поступаем аналогично для всех частей лица
if File.exist?(file_path2)
  file2 = File.new(file_path2)
  eyes = file2.readlines
  file2.close
else
  puts "Файл не найден"
end

if File.exist?(file_path3)
  file3 = File.new(file_path3)
  nose = file3.readlines
  file3.close
else
  puts "Файл не найден"
end

if File.exist?(file_path4)
  file4 = File.new(file_path4)
  mouth = file4.readlines
  file4.close
else
  puts "Файл не найден"
end

# Рисуем рожицу, выбирая произвольный элемент массива благодаря методу sample
puts forehead.sample
puts eyes.sample
puts nose.sample
puts mouth.sample












