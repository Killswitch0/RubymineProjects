class Post
  def initialize
    @created_at = Time.now
    @text = nil
  end

  def read_from_console
    # to do
  end

  def to_strings
    # to do
  end

  def save
    file = File.new(file_path, "w:UTF-8")

    to_strings.each { |item| file.puts(item) }

    file.close
  end

  def file_path
    current_path = File.dirname(__FILE__ )

    file_name = @created_at.strftime("#{self.class.name}_%y-%m-%d_%H-%M_%S.txt")

    current_path + "/" + file_name
  end
end