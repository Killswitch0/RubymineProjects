require 'sqlite3'

# Базовый класс «Запись» — здесь мы определим основные методы и свойства,
# общие для всех типов записей.
class Post

  @@SQLITE_DB_FILE = 'notepad.sqlite'

  # Метод post_types класса Post, возвращает всех известных ему детей класса
  # Post в виде массива классов.
  #
  # Обратите внимание, что класс, объявленный с self. перед название — это не
  # метод экземпляра класса, а метод самого класса (их ещё часто называют
  # статические методы).
  def self.post_types
    {"Memo" => Memo, "Task" => Task, "Link" => Link}
  end

  # Строго говоря этот метод self.types не очень хорош — код родительского
  # класса в идеале не должен никак зависеть от того, какие у него дети. Мы его
  # использовали для простоты (адекватно поставленной задаче).
  #
  # В сложных приложениях это делается немного иначе: например отдельный класс
  # владеет всей информацией, и умеет создавать нужные объекты (т. н. шаблон
  # проектирования «Фабрика»).
  #
  # Или каждый дочерний класс динамически регистрируется в подобном массиве
  # сам во время загрузки программы.
  #
  # Подробнее об этом вы можете прочитать в книгах о паттернах проектирования,
  # ссылки на которых приведены в дополнительных материалах.

  # Метод create класса Post динамически (в зависимости от параметра) создает
  # объект нужного класса (Memo, Task или Link) из набора возможных детей,
  # получая список с помощью метода post_types, объявленного выше.
  def self.create(type)
    post_types[type].new
  end

  def self.find(limit, type, id)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)

    #  1. конкретная запись
    if !id.nil?
      db.results_as_hash = true

      result = db.execute("SELECT * FROM posts WHERE rowid = ?", id )

      result = result[0] if result.is_a? Array
    else
      #  2. вернуть таблицу записей

    end
  end

  def initialize
    @created_at = Time.now
    @text = []
  end

  def read_from_console
    # этот метод должен быть реализован у каждого ребенка
  end

  def to_strings
    # этот метод должен быть реализован у каждого ребенка
  end

  def save
    file = File.new(file_path, "w:UTF-8")

    to_strings.each { |string| file.puts(string) }

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__ )

    file_name = @created_at.strftime("#{self.class.name}_%y-%m-%d_%H-%M_%S.txt")

    current_path + "/" + file_name
  end

  def save_to_db
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)
    db.results_as_hash = true

    db.execute(
      "INSERT INTO posts (" +
        to_db_hash.keys.join(',') +
        ")" +
        " VALUES (" +
        ('?,' * to_db_hash.keys.size).chomp(',') +
        ")",
      to_db_hash.values
    )

    insert_row_id = db.last_insert_row_id

    db.close

    insert_row_id
  end

  def to_db_hash
    {
      'type' => self.class.name,
      'created_at' => @created_at.to_s
    }
  end
end