class Transaction
  attr_reader :id
  attr_reader :product
  attr_reader :customer

  def initialize(customer_name, product_purchased)
    customer = customer_name
    product = product_purchased
  end

  def find

  end
end