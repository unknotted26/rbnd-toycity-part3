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

  def find_by_name

  end

  private

  def add_to_customers
    if(@@customers.index(@name) != 0)
      raise DuplicateCustomerError, "DuplicateCustomerError: '#{name}' already exists."
    end
    @@customers << self
  end

end