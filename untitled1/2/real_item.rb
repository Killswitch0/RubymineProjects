class RealItem < Item
  attr_accessor :weight

  def initialize(options)
    @weight = options[:weight]
    super
  end

  def info
    if block_given?
      yield weight
      super
    else
      puts 'Nothing to show'
    end
  end
end