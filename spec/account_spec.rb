# frozen_string_literal: true

require 'account'

describe Account do
  subject(:account) { Account.new }

  context '#deposit' do
    it 'When money is deposited balances increases' do
      account.deposit(50)
      expect(account.balance).to eq 50
    end

    # is this test  needed?
    it 'When money is deposited multiple times balance is incremented' do
      3.times { account.deposit(50) }
      expect(account.balance).to eq 150
    end

    it 'When money is deposited the statement is updated' do
      @test_time = Time.parse('2012-01-13')
      allow(Time).to receive(:now).and_return @test_time
      account.deposit(50)
      expect(account.statement).to eq([{ credit: 50, balance: 50, date: '13/01/2012' }])
    end

    it 'When money is deposited  the statement is updated everytime' do
      @test_time = Time.parse('2012-01-13')
      allow(Time).to receive(:now).and_return @test_time
      #john = Customer.new('John Smith', 'password1')
      account.deposit(50)
      account.deposit(100)
      # formatting
      expect(account.statement).to eq([ { credit: 50, balance: 50, date: '13/01/2012'},
                                        { credit: 100, balance: 150, date: '13/01/2012'}
                                      ])
    end
    context '#withdraw' do
      it 'When money is withdrawn balance will decrease' do
        account.deposit(50)
        account.withdraw(25)
        expect(account.balance).to eq 25
      end 

      it 'When money withdrawn  the statement is updated' do
        @test_time = Time.parse('2012-01-13')
        allow(Time).to receive(:now).and_return @test_time
        account.deposit(50)
        account.withdraw(25)
        expect(account.statement).to eq ([
          { credit: 50, balance: 50, date: '13/01/2012' },
          { debit: 25, balance: 25, date: '13/01/2012' }
        ])
      end 
    end
    context '#Print_statement' do
      it 'Customer can print statement' do 
        @test_time = Time.parse('2012-01-13')
        allow(Time).to receive(:now).and_return @test_time
        printed_header = "date || credit || debit || balance\n"
        printed_credit_statement = "13/01/2012 || 50 ||  || 50\n" 
        printed_debit_statement  = "13/01/2012 ||  || 30 || 20\n"
        account.deposit(50)
        account.withdraw(30)
        expect{account.print_statement}. to output(printed_header + printed_debit_statement + printed_credit_statement).to_stdout
      end
    end
  end
end 

