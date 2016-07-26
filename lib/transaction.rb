class Transaction
  attr_reader :id
  attr_reader :product
  attr_reader :customer
  @@transactions = []

  def initialize(customer_object, product_object)
    @customer = customer_object
    @product = product_object
    @product.stock = product.stock - 1
    @id = @@transactions.size + 1
    @@transactions << self
  end

  def self.all
    @@transactions
  end

  def self.find(transaction_id)
    @@transactions[transaction_id-1]
  end
end