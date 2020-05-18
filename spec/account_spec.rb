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
end
