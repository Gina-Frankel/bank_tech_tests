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
      account.deposit(50)
      account.deposit(100)
      expect(account.statement).to eq([{ credit: 50, balance: 50, date: '13/01/2012' },
                                       { credit: 100, balance: 150, date: '13/01/2012' }])
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
        expect(account.statement).to eq [
          { credit: 50, balance: 50, date: '13/01/2012' },
          { debit: 25, balance: 25, date: '13/01/2012' }
        ]
      end
    end

    context '#send_printer' do
      it 'responds to send_printer' do
        expect(account).to respond_to(:send_printer)
      end
      it 'returns nil when sent to the printer' do
        account.deposit(50)
        account.withdraw(30)
        expect(account.send_printer).to eq account.statement
      end
    end
  end
end
