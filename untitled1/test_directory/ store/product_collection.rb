class ProductCollection
  PRODUCT_TYPES = {
    film: {dir: 'film', class: Film},
    book: {dir: 'book', class: Book}
  }

  def initialize(products = [])
    @products = products
  end

  def self.from_dir(dir_path)
    products = []

    PRODUCT_TYPES.each do |type, hash|
      product_dir = hash[:dir]

      product_class = hash[:class]

      Dir[dir_path + '/' + product_dir + '/*.txt'].each do |path|
        products << product_class.read_from_file(path)
      end
    end

    self.new(products)
  end

  def to_a
    @products
  end

  def sort!(params)
    case params[:by]
    when :title
      @products.sort_by! { |product| product.to_s }
    when :amount
      @products.sort_by! { |product| product.amount.to_i }
    when :price
      @products.sort_by! { |product| product.price.to_i }
    end

    @products.reverse! if params[:order] == :asc
  end
end