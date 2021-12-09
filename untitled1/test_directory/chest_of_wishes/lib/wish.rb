class Wish
  def initialize(node)
    @text = node.text.strip
    @date = Date.parse(node.attributes["date"])
  end

  def overdue?
    @date <= Date.today
  end

  def to_s
      "#{@date.strftime("%d.%m.%Y")}: #{@text}"
  end
end