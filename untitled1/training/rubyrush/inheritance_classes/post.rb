class Post

  def self.post_types
    [Memo, Task, Link]
  end

  def self.create(type_index)
    post_types[type_index].new
  end

  def initialize
    @created_at = Time.now
    @text = []
  end

  def read_from_console
    # to do
  end

  def to_strings
    # to do
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
end