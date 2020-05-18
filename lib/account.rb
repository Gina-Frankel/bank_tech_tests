require 'bcrypt'

class Account
  attr_reader :customer_name, :password, :signed_in, :balance, :statement
  def initialize
    @signed_in 
    @balance = 0
    @statement = [ ]
  end

  def register(customer)
    @customer_name = customer.name
    @password = customer.password
  end

  def sign_in(name, password)
    if validate?(name, password) 
      @signed_in = true
    else 
      raise 'Wrong name or password'
    end 
  end

  def validate?(name, password)
    name == @customer_name && @password == password
  end

  def deposit(money)
    @balance += money
    record_credit(money)
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  def record_credit(money)
    @statement.push({ credit: money, balance: @balance, date: date })
  end


end
