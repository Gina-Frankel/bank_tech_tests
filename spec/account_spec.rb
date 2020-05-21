# frozen_string_literal: true

require 'account'

describe Account do

  describe '#deposit' do
    it 'when money is deposited balances increases' do
      account = Account.new

      balance = '50.00 pounds'
      expect(account.deposit(50)).to eq "Deposit of 50.00 pounds was successful, current balance is #{balance}."
    end
 
    it 'when money is deposited multiple times balance is incremented' do
      account = Account.new

      account.deposit(100)
      account.deposit(50)

      balance = '175.00 pounds'
      expect(account.deposit(25)).to eq "Deposit of 25.00 pounds was successful, current balance is #{balance}."
    end


    describe '#withdraw' do
      it 'when money is withdrawn balance will decrease' do
        account = Account.new

        account.deposit(50)
        account.withdraw(25)

        expect(account.balance).to eq 25
      end

    end

    it  "money cannot be withdrawn if balance is 0" do
      account = Account.new

      expect{ account.withdraw(1)}.to raise_error 'You have no money in your account'
    end

    describe'#send_printer' do
    

      xit "returns a confirmation string when statement is printed"do
        #dependent on Printer class rspeto work 
        account = Account.new

        account.deposit(50)

        expect(account.print_statement).to eq "Your statement has been printed"
      end
    end
  end
end
