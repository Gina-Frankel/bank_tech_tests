# frozen_string_literal: true

require 'account'

describe Account do

  context '#deposit' do
    it 'When money is deposited balances increases' do
      account = Account.new
      
      account.deposit(50)
      
      expect(account.balance).to eq 50
    end
 
    it 'When money is deposited multiple times balance is incremented' do
      account = Account.new

      3.times { account.deposit(50) }

      expect(account.balance).to eq 150
    end

    it 'When money is deposited the statement is updated' do
      account = Account.new
      @test_time = Time.parse('2012-01-13')
      allow(Time).to receive(:now).and_return @test_time

      account.deposit(50)

      expect(account.statement).to eq([{ credit: 50, balance: 50, date: '13/01/2012' }])
    end

    it 'When money is deposited  the statement is updated everytime in order of newest to oldest' do
      account = Account.new
      test_time = Time.parse('2012-01-13')
      allow(Time).to receive(:now).and_return test_time

      account.deposit(50)
      account.deposit(100)
      
      oldest_depsosit = { credit: 50, balance: 50, date: '13/01/2012' }
      newest_deposit = { credit: 100, balance: 150, date: '13/01/2012' }
      expect(account.statement).to eq([newest_deposit, oldest_depsosit ])
    end

    context '#withdraw' do
      it 'When money is withdrawn balance will decrease' do
        account = Account.new

        account.deposit(50)
        account.withdraw(25)

        expect(account.balance).to eq 25
      end

      it 'When money withdrawn  the statement is updated in order of newest to oldest transaction' do
        account = Account.new
        @test_time = Time.parse('2012-01-13')
        allow(Time).to receive(:now).and_return @test_time

        account.deposit(50)
        account.withdraw(25)

        oldest_transaction = { credit: 50, balance: 50, date: '13/01/2012' }
        newest_transaction= { debit: 25, balance: 25, date: '13/01/2012' }

        expect(account.statement).to eq [
          newest_transaction,
          oldest_transaction
        ]
      end
    end

    context '#send_printer' do
      it 'responds to send_printer' do
        account = Account.new

        expect(account).to respond_to(:send_printer)
      end

      it 'returns the statement value when sent to the printer' do
        account = Account.new

        account.deposit(50)
        account.withdraw(30)

        expect(account.send_printer).to eq account.statement
      end
    end
  end
end
