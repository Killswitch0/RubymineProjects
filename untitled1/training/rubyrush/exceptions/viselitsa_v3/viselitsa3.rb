current_path =  File.dirname(__FILE__ )

require_relative 'game'
require_relative 'result_printer'
require_relative 'word_reader'

printer = ResultPrinter.new

reader = WordReader.new

slovo = reader.read_from_file(current_path + '/data/wwords.txt')

game = Game.new(slovo)

while game.status == 0
  printer.print_status(game)
  game.ask_next_letter
end

printer.print_status(game)