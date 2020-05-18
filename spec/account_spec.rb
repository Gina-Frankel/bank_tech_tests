# frozen_string_literal: true

require 'account'

describe Account do
  it 'can register a new customer with their name' do
    account = Account.new
    customer = Customer.new('John Smith', 'password1')
    account.register(customer)
    expect(account.customer_name).to eq 'John Smith'
  end

  it 'can register a new customer with a password' do
    account = Account.new
    customer = Customer.new('John Smith', 'password1')
    account.register(customer)
    expect(account.password).to eq 'password1'
  end

  it 'customers can sign in' do
    account = Account.new
    john = Customer.new('John Smith', 'password1')
    account.register(john)
    account.sign_in('John Smith', 'password1')
    expect(account.signed_in).to eq true 
  end

  it 'customers can deposit money' do
    account = Account.new
    john = Customer.new('John Smith', 'password1')
    account.register(john)
    account.sign_in('John Smith', 'password1')
    account.deposit(50)
    expect(account.balance).to eq 50
  end

  # is this test  needed?
  it 'customers can deposit multiple amountsmoney' do
    account = Account.new
    john = Customer.new('John Smith', 'password1')
    account.register(john)
    account.sign_in('John Smith', 'password1')
    account.deposit(50)
    account.deposit(100)
    account.deposit(50)
    expect(account.balance).to eq 200
  end


end
