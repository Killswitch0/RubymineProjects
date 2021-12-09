require 'rexml/document'
require 'date'

file_path = File.dirname(__FILE__ ) + "/my_expenses.xml"

file = File.new(file_path, "r:UTF-8")
doc = REXML::Document.new(file)
file.close

abort "Файл #{file_path} не найден" unless File.exist?(file_path)

amount_by_day = {}

doc.elements.each('expenses/expense') do |item|
  loss_sum = item.attributes['amount'].to_i
  loss_date = Date.parse(item.attributes['date'])

  amount_by_day[loss_date] ||= 0
  amount_by_day[loss_date] += loss_sum
end

sum_by_month = {}

amount_by_day.keys.sort.each do |key|
  sum_by_month[key.strftime("%B %Y")] ||= 0
  sum_by_month[key.strftime("%B %Y")] += amount_by_day[key]
end

current_month = amount_by_day.keys.sort[0].strftime("%B %Y")

puts "Всего потрачено в #{current_month}: #{sum_by_month[current_month]} грн."

amount_by_day.keys.sort.each do |key|
  if key.strftime("%B %Y") != current_month
    current_month = key.strftime("%B %Y")

    puts "Всего потрачено в #{current_month}: #{sum_by_month[current_month]} грн."
  end

  puts "\t#{key.day}: #{amount_by_day[key]} грн."
end
