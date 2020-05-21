require_relative 'printer'
require_relative 'transaction_recorder'

class Account
  attr_reader :balance, :statement, :currency, :printer,  :transaction
  def initialize(currency: 'pounds')
    @balance = 0
    @statement = []
    @currency = currency 
    @printer = Printer.new
  end

  def deposit(number)
    add_deposit(number)
    statement.unshift(create_transaction(number))
    "Deposit of #{add_pence(number)} #{currency} was successful, current balance is #{add_pence(balance)} #{currency}."
  end

  def withdraw(number)
    raise 'You have no money in your account' if balance == 0
    minus_withdrawal(number)
    statement.unshift(create_transaction(number))
    "Withdrawal of #{add_pence(number)} #{currency} was successful, current balance is #{balance} #{currency}"
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

  def create_transaction(number)
    Transaction.new(balance: balance, debit: number , credit: number )
  end

  def add_deposit(number)
    @balance += number
  end

  def minus_withdrawal(number)
    @balance -= number
  end

end
