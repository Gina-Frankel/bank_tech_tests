require 'bcrypt'

class Account
  attr_reader :customer_name, :password, :signed_in
  def initialize
    @signed_in 
  end

  def register(customer)
    @customer_name = customer.name
    @password = customer.password
  end

  def sign_in(name, password)
    if validate?(name, password)
      @signed_in = true 
    end 
  end 
  def validate?(name, password)
    name == @customer_name && @password == password
  end 


end
