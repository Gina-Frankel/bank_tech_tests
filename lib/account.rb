require 'bcrypt'

class Account
  attr_reader :customer_name, :password, :signed_in, :balance, :statement
  def initialize
    @signed_in 
    @balance = 0
    @statement = {}
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

  def deposit(money)
    @balance = @balance + money
    date = Time.now
    @statement = [{credit: money, balance: @balance, date: date.strftime("%d/%m/%Y") }]
  end 

end
