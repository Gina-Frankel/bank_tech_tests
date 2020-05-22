require_relative 'printer'
require_relative 'transaction'

class Account
  attr_reader :balance, :statement, :currency, :printer, :transaction
  def initialize(currency: 'pounds')
    @balance = 0
    @statement = []
    @currency = currency
    @printer = Printer.new
  end

  def deposit(number)
    add_deposit(number)
    statement.unshift(credit_transaction(number))
    "Deposit of #{add_pence(number)} #{currency} was successful, current balance is #{add_pence(balance)} #{currency}."
  end

  def withdraw(number)
    raise 'You have no money in your account' if balance == 0
    minus_withdrawal(number)
    statement.unshift(debit_transaction(number))
    "Withdrawal of #{add_pence(number)} #{currency} was successful, current balance is #{add_pence(balance)} #{currency}."
  end

  def print_statement
    printer.print(statement)
    'Your statement has been printed'
  end

  private
    # can be module? 
  def add_pence(number)
    '%.2f' % number unless number.nil?
  end

  def credit_transaction(number)
    Transaction.new(balance: add_pence(balance), debit: nil, credit: add_pence(number) )
  end

  def debit_transaction(number)
    Transaction.new(balance: add_pence(balance), debit: add_pence(number), credit: nil )
  end

  def add_deposit(number)
    @balance += number
  end

  def minus_withdrawal(number)
    @balance -= number
  end

end
