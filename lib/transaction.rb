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

  # returns a transaction object; nil if invalid id
  def self.find(transaction_id)
    if transaction_id > 0
      @@transactions[transaction_id-1]
    end
  end

  def self.rollback(customer, product)
    @@transactions.reject!{|t| t.customer == customer && t.product == product; product.stock+=1}
  end

  def self.gross_profit
    @@transactions.inject(0){|sum, t| sum + t.product.price}
  end

end