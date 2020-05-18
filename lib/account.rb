

class Account
  attr_reader :customer_name, :password
  def initialize
  end

  def register(customer)
    @customer_name = customer.name
    @password = customer.password
  end
end
