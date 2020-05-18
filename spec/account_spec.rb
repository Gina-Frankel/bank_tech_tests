# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { Account.new }
  let(:john) { Customer.new('John Smith', 'password1') }

  context '#register' do
    it 'can register a new customer with their name' do
      customer = Customer.new('John Smith', 'password1')
      account.register(customer)
      expect(account.customer_name).to eq 'John Smith'
    end
    it 'can register a new customer with a password' do
      customer = Customer.new('John Smith', 'password1')
      account.register(customer)
      expect(account.password).to eq 'password1'
    end
  end 

  context '#sign_in' do
    it 'customers can sign in' do
      john = Customer.new('John Smith', 'password1')
      account.register(john)
      account.sign_in('John Smith', 'password1')
      expect(account.signed_in).to eq true 
    end
  end 

  context '#deposit' do
    it 'customers can deposit money' do
      john = Customer.new('John Smith', 'password1')
      account.register(john)
      account.sign_in('John Smith', 'password1')
      account.deposit(50)
      expect(account.balance).to eq 50
    end

    # is this test  needed?
    it 'customers can deposit multiple amounts of money' do
      john = Customer.new('John Smith', 'password1')
      account.register(john)
      account.sign_in('John Smith', 'password1')
      3.times  { account.deposit(50) }
      expect(account.balance).to eq 150
    end
  
    it 'When money is deposited the statement is updated' do
      @test_time = Time.parse("2012-01-13")
      allow(Time).to receive(:now).and_return @test_time
      john = Customer.new('John Smith', 'password1')
      account.register(john)
      account.sign_in('John Smith', 'password1')
      account.deposit(50)
      expect(account.statement).to eq([{ credit: 50, balance: 50, date: '13/01/2012' }])
    end
  end 
end
