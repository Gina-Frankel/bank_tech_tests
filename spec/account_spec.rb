# frozen_string_literal: true

require 'account'

describe Account do

  describe '#deposit' do
    it 'when money is deposited balances increases' do
      account = Account.new

      balance = '50.00 pounds'
      confirmation = "Deposit of 50.00 pounds was successful, current balance is #{balance}."
      expect(account.deposit(50)).to eq confirmation
    end
 
    it 'when money is deposited multiple times balance is incremented' do
      account = Account.new

      account.deposit(100)
      account.deposit(50)

      balance = '175.00 pounds'
      confirmation = "Deposit of 25.00 pounds was successful, current balance is #{balance}."
      expect(account.deposit(25)).to eq confirmation
    end

    describe '#withdraw' do
      it 'when money is withdrawn balance will decrease' do
        account = Account.new

        account.deposit(50)

        balance = '25.00 pounds'
        confirmation = "Withdrawal of 25.00 pounds was successful, current balance is #{balance}."
        expect(account.withdraw(25)).to eq confirmation
      end

    end

    it 'money cannot be withdrawn if balance is 0' do
      account = Account.new

      failure_message = 'You have no money in your account'
      expect { account.withdraw(1) }.to raise_error failure_message
    end

    describe '#send_printer' do
      it 'returns a confirmation string when statement is printed' do
        account = Account.new

        account.deposit(50)
        confirmation = 'Your statement has been printed'
        expect(account.print_statement).to eq confirmation
      end
    end
  end
end
