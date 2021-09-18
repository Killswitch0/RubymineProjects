
# Пишет в переменные путь к фалу questions и answers
file_path1 = './data/questions.txt'
file_path2 = './data/answers.txt'

# Если какого-то из файлов нет, досрочно выходим из программы и сообщаем об этом пользователю
unless File.exist?(file_path1) && File.exist?(file_path2)
  abort "Один из файлов не найден"
end

# Переменная current_answers содержит число правильных ответов, которое в случае угадывания
# мы увеличиваем на 1
correct_answers = 0

# Переменная ans_index содержит индекс элемента массива ans(ответы). Мы ее увеличиваем на 1 каждый раз,
# независимо от правильности ответа.
ans_index = 0


# Открываем файл c вопросами, считываем вопросы в массив questions и закрываем
# файл. Аналогично, считываем все ответы в массив answers.
questions = File.new(file_path1)
quest = questions.readlines
questions.close


answers = File.new(file_path2)
ans = answers.readlines
answers.close


# В цикле проходимся по каждому вопросу, который попадает в переменную question,
# выводим этот question, в переменной user мы ждем пользовательский ввод, который
# является ответом.
# Если ответ правильный - увеличиваем переменную correct_answers на 1
# и переменную ans_index. Если ответ неверный - увеличиваем только ans_index.
quest.each do |question|
  puts question
  user = STDIN.gets.chomp

  if user == ans[ans_index].chomp
    puts "Ответ верный!"
    correct_answers += 1
  else
    puts "Ответ неверный!"
  end


  ans_index += 1
end

# Выводим число правильных ответов
puts "Вы ответили правильно на #{correct_answers.to_s} из 3-х вопросов"

















