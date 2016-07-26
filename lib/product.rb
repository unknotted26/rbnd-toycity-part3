class Product
  attr_reader :title
  attr_reader :price
  attr_accessor :stock
  @@products = []

  def initialize(options={})
    @title = options[:title]
    @price = options[:price]
    @stock = options[:stock]
    add_to_products
  end

  def self.all
    @@products
  end

  #############################################
  ######## accessors ##########################
  #############################################

  def self.find_by_title(item_title)
    @@products.each do |prod|
      if prod.title == item_title
        return prod
      end
    end
  end

  def in_stock?
    !stock.equal?(0) #returns true of items are in stock
  end

  # return array of all products with stock > 0
  def self.in_stock
    @@products.select{|x| x.stock > 0}
  end

  #used with array returned by in_stock
  def include?(product)
    @@products.index(product)
  end

  #############################################
  ######## mutators ###########################
  #############################################

  private

  def add_to_products
    if(@@products.index{|x| x.title == @title} != nil)
      raise DuplicateProductError, "DuplicateProductError: '#{self.title}' already exists."
    end
    @@products << self
  end

end # class Product
