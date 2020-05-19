# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { Account.new }
  let(:john) { Customer.new('John Smith', 'password1') }




  context '#deposit' do
    it 'customers can deposit money' do
      john = Customer.new('John Smith', 'password1')
      account.register(john)
      account.deposit(50)
      expect(account.balance).to eq 50
    end

    # is this test  needed?
    it 'customers can deposit multiple amounts of money' do
      john = Customer.new('John Smith', 'password1')
      account.register(john)
      3.times { account.deposit(50) }
      expect(account.balance).to eq 150
    end

    it 'When money is deposited the statement is updated' do
      @test_time = Time.parse('2012-01-13')
      allow(Time).to receive(:now).and_return @test_time
      john = Customer.new('John Smith', 'password1')
      account.register(john) 
      account.deposit(50)
      expect(account.statement).to eq([{ credit: 50, balance: 50, date: '13/01/2012' }])
    end

    it 'When money is deposited  the statement is updated everytime' do
      @test_time = Time.parse('2012-01-13')
      allow(Time).to receive(:now).and_return @test_time
      john = Customer.new('John Smith', 'password1')
      account.register(john)
      account.deposit(50)
      account.deposit(100)
      expect(account.statement).to eq([
                                        { credit: 50, balance: 50, date: '13/01/2012' },
                                        { credit: 100, balance: 150, date: '13/01/2012' }
                                      ])
    end
    # context '#withdraw' do
    #   it 'When money is withdrawn balance will decrease' do
    #     john = Customer.new('John Smith', 'password1')
    #     account.register(john)
    #     account.sign_in('John Smith', 'password1')
    #     account.deposit(50)
    #     account.withdraw(25)
    #     expect(account.balance).to eq 25
    #   end 
    # end
  end
end
