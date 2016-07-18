class Product
  @@products = {}
  def initialize(options={})
    @@products = options
    puts "Initializing #{@@products}"
  end

  def self.all
    @@products
  end
end
