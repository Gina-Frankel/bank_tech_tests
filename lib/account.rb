require_relative 'printer'
require_relative 'transaction_recorder'

class Account
  attr_reader :customer_name, :password, :signed_in, :balance, :statement
  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(money)
    add_deposit(money)
    statement.unshift(transaction_recorder_creator.record(credit:money))
  end
  

def transaction_recorder_creator
  TransactionRecorder.new(balance: balance)
end 

  def withdraw(money)
    raise 'You have no money in your account' if balance == 0 
    minus_withdrawal(money)
    statement.unshift(transaction_recorder_creator.record(debit:money))
  end


  def send_printer
    printer = Printer.new
    printer.print_statement(statement)
  end


  def record_debit(money)
    statement.unshift({ credit: nil, debit: money, balance: balance, date: date })
  end

  def date
    Time.now.strftime('%d/%m/%Y')
  end

  private 
  def add_deposit(money)
    @balance += money
  end 

  def minus_withdrawal(money)
    @balance -= money
  end 


end
