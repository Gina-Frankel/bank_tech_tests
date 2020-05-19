require_relative 'printer'

class Account
  attr_reader :customer_name, :password, :signed_in, :balance, :statement
  def initialize
    @balance = 0
    @statement = []
  end

  def deposit(money)
    @balance += money
    record_credit(money)
  end

  def withdraw(money)
    @balance -= money
    record_debit(money)
  end

  def send_printer
    printer = Printer.new
    printer.print_statement(@statement)
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
