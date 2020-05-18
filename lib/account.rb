class Account
  attr_reader :customer_name
  def initialize
    @customer_name
  end
  def register(customer) 
    @customer_name = customer.name 
  end 
end