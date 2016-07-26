class Customer
  attr_reader :name
  @@customers = []
  def initialize(options={})
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  # returns Customer object; nil if not found
  def self.find_by_name(customer_name)
    @@customers.find{|cust| cust.name == customer_name}
  end

  def purchase(product)
    if product.stock > 0 # if in stock
      Transaction.new(self, product)
    else
      raise OutOfStockError, "OutOfStockError: '#{product.title}' is out of stock."
    end
  end

  def return(product)
#    Transaction.rollback(self, product)
  end

  private

  def add_to_customers
    if(@@customers.index{|cust| cust.name == @name} != nil)
      raise DuplicateCustomerError, "DuplicateCustomerError: '#{name}' already exists."
    end
    @@customers << self
  end

end