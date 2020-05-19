require 'bcrypt'

class Account
  attr_reader :customer_name, :password, :signed_in, :balance, :statement
  def initialize
    @signed_in 
    @balance = 0
    @statement = [ ]
  end


  def deposit(money)
    @balance += money
    record_credit(money)
  end

  def withdraw(money)
    @balance -= money
    record_debit(money)
  end 

  def print_statement
    puts "date || credit || debit || balance"
    @statement.reverse!
    @statement.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end 
  end 

  def record_credit(money)
    @statement.push({ credit: money, balance: @balance, date: date })
  end

  def record_debit(money)
    @statement.push({ debit: money, balance: @balance, date: date })
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end


end
