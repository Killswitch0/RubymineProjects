choice = nil

# Этот цикл будет повторяться пока пользователь не введет 1 ИЛИ 22 ИЛИ 3,
# обратите внимание, что nil (начальное значение choice) не подходит, поэтому
# мы как минимум один раз выполним тело цикла.
until choice == 1 || choice == 2 || choice == 3 do
  puts 'Введите число и нажмите Enter:'
  puts '1 – Пойти направо'
  puts '22 – Пойти налево'
  puts '3 – Пойти домой'

  # Записываем то, что выбрал пользователь, переводя его строку в число
  choice = gets.to_i
end