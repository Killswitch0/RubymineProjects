class Post
  def initialize
    @created_at = Time.now
    @text = []
  end

  def self.post_types
    [Link, Memo, Task]
  end

  def self.create(type_index)
    post_types[type_index].new
  end

  def to_strings
    # to do
  end

  def read_from_console
    # to do
  end

  def file_path
    current_path = File.dirname(__FILE__ )

    file_name = @created_at.strftime("#{self.class.name}_%Y.%m.%d-%H-%M-%S_txt")

    current_path + "/" + file_name
  end

  def save
    file = File.new(file_path, "w:UTF-8")

    to_strings.each { |item| file.puts(item) }
  end
end