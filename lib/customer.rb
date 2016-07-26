class Customer
  attr_reader :name
  @@customers = []
  def initialize(options={})
    puts "Adding new customer"
    @name = options[:name]
    add_to_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(customer_name)
    @@customers[@@customers.index{|cust| cust.name == customer_name}]
  end

  private

  def add_to_customers
    if(@@customers.index{|cust| cust.name == @name} != nil)
      raise DuplicateCustomerError, "DuplicateCustomerError: '#{name}' already exists."
    end
    @@customers << self
  end

end