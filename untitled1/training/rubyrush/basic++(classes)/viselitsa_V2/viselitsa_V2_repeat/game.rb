class Game

  attr_reader :letters,
              :good_letters,
              :bad_letters,
              :errors,
              :status

  def initialize(slovo)
    @letters = get_letters(slovo)

    @errors = 0

    @good_letters = []
    @bad_letters  = []

    @status = 0
  end

  def get_letters(slovo)
    if slovo == nil || slovo == ""
      abort "Вы не ввели слово для игры"
    end

    return slovo.split("")
  end

  def ask_next_letter
    puts "\n Введите следующую букву"

    letter = ""

    while letter == ""
      letter = STDIN.gets.chomp
    end

    next_step(letter)
  end

  def next_step(bukva)
    if @status == -1 || @status == 1
      return
    end

    if @good_letters.include?(bukva) || @bad_letters.include?(bukva)
      return
    end

    if @letters.include?(bukva)
      @good_letters << bukva

      if @good_letters.size == @letters.uniq.size
        @status = 1
      end
    else
      @bad_letters << bukva
      @errors += 1

      if @errors >= 7
        @status = -1
      end
    end

  end







end