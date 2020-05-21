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
    #record_credit(money)
    transaction_recorder = TransactionRecorder.new(balance: balance)
    statement.unshift(transaction_recorder.record(credit:money))

  end

  def withdraw(money)
    raise 'You have no money in your account' if balance == 0 
    minus_withdrawal(money)
    #record_debit(money)
    transaction_recorder = TransactionRecorder.new(balance: balance)
    statement.unshift(transaction_recorder.record(debit:money))
  end

  def send_printer
    printer = Printer.new
    printer.print_statement(statement)
  end

  # def record_credit(money)
  #   statement.unshift({ credit: money, debit: nil, balance: balance, date: date })
  # end

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
