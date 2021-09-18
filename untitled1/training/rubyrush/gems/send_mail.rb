require 'pony'
require 'io/console'

my_mail = "maximpanin1996@gmail.com"

puts "Введите пароль от вашей почты #{my_mail} для отправки письма:"
password = STDIN.noecho(&:gets).chomp

puts "Кому отправить письмо?"
sent_to = STDIN.gets.chomp

puts "Что напистаь в письме?"
body = STDIN.gets.chomp

begin
  Pony.mail(

    subject: "Привет из руби!",
    body: body,
    to: sent_to,
    from: my_mail,

    via: :smtp,
    via_options: {
                  address: 'smtp.gmail.com',
                  port: '587',
                  enable_starttls_auto: true,
                  user_name: my_mail,
                  password: password,
                  authentication: :plain
    }
)
rescue
  puts "[ Не удалось отправить письмо ]"
ensure
  puts "[ Попытка отправки письма закончена ]"
end

puts "Письмо успешно отправлено!"





