class Transaction
  attr_reader :id
  attr_reader :product
  attr_reader :customer
  attr_reader :date
  @@transactions = []

  def initialize(customer_object, product_object)
    @customer = customer_object
    @product = product_object
    @product.stock = product.stock - 1
    @id = @@transactions.size + 1
    @date = Time.now.asctime
    @@transactions << self
  end

  def self.all
    @@transactions
  end

  # returns a transaction object
  def self.find(transaction_id)
    @@transactions[transaction_id-1]
  end

  def rollback(customer, product)

  end

  def self.remove_transaction

  end

end