# Во-первых, сразу подключим sqlite3
# Подключать библиотеки лучше всего в тех файлах/классах, который их используют
require 'sqlite3'

# Базовый класс «Запись» — здесь мы определим основные методы и свойства,
# общие для всех типов записей.
class Post

  # Статическое поле класса или class variable
  # аналогично статическим методам принадлежит всему классу в целом
  # и доступно незвисимо от созданных объектов
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

  # Находит в базе запись по идентификатору из базы данных,
  # который можно например показать в виде таблицы на экране
  def self.find_by_id(id)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE) # открываем "соединение" к базе SQLite
    db.results_as_hash = true # настройка соединения к базе, он результаты из базы преобразует в Руби хэши

    # выполняем наш запрос, он возвращает массив результатов, в нашем случае из одного элемента
    result = db.execute("SELECT * FROM posts WHERE rowid = ?", id)

    result = result[0] if result.is_a? Array # получаем единственный результат (если вернулся массив)

    db.close

    # создаем с помощью нашего же метода create экземпляр поста,
    # тип поста мы взяли из массива результатов [:type]
    # номер этого типа в нашем массиве post_type нашли с помощью метода Array#find_index
    if result.empty?
      puts "Такой #{id} не найден в базе"
    else
      post = create(result['type'])
      post.load_data(result) # заполним этот пост содержимым

      post # и вернем его
    end
  end

  # Метод find_all выводит всю таблицу записей из базы данных
  # или все записи по параметру limit, type
  def self.find_all(limit, type)
    db = SQLite3::Database.open(@@SQLITE_DB_FILE)
    db.results_as_hash = false

    # формируем запрос в базу с нужными условиями
    query = "SELECT rowid, * FROM posts "

    query += "WHERE type = :type " unless type.nil? # если задан тип, надо добавить условие
    query += "ORDER by rowid DESC " # и наконец сортировка - самые свежие в начале

    query += "LIMIT :limit " unless limit.nil? # если задан лимит, надо добавить условие

    # готовим запрос в базу
    statement = db.prepare query

    statement.bind_param('type', type) unless type.nil? # загружаем в запрос тип вместо плейсхолдера
    statement.bind_param('limit', limit) unless limit.nil? # загружаем лимит вместо плейсхолдера

    result = statement.execute! #(query) # выполняем
    statement.close
    db.close

    result
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

  # Наконец, вот он метод, сохраняющий состояние объекта в базу данных
  def save_to_db
    db = SQLite3::Database.open(@@SQLITE_DB_FILE) # открываем "соединение" к базе SQLite
    db.results_as_hash = true # настройка соединения к базе, он результаты из базы преобразует в Руби хэши

    # запрос к базе на вставку новой записи в соответствии с хэшом, сформированным дочерним классом to_db_hash
    db.execute(
      "INSERT INTO posts (" +
        to_db_hash.keys.join(',') + # все поля, перечисленные через запятую
        ")" +
        " VALUES (" +
        ('?,' * to_db_hash.keys.size).chomp(',') + # строка из заданного числа _плейсхолдеров_ ?,?,?...
        ")",
      to_db_hash.values # массив значений хэша, которые будут вставлены в запрос вместо _плейсхолдеров_
    )

    insert_row_id = db.last_insert_row_id

    # закрываем соединение
    db.close

    insert_row_id
  end

  def to_db_hash
    {
      'type' => self.class.name,
      'created_at' => @created_at.to_s
    }
  end

  # получает на вход хэш массив данных и должен заполнить свои поля
  def load_data(data_hash)
    @created_at = Date.parse(data_hash['created_at'])
  end
end