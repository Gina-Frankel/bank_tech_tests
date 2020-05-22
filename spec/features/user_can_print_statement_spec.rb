require 'account'

context '#User prints statement of transactions' do
  it 'Customer can print statement' do

    newest_time = Time.parse('2020-05-21 11:55:00 +0100 ')
    allow(Time).to receive(:now).and_return newest_time

 


    account = Account.new
    account.deposit(1000)
    account.deposit(2000)
    account.withdraw(500)



    printed_header = "date || credit || debit || balance\n"
    newest_transaction = "21/05/2020 ||  || 500.00 || 2500.00\n"
    middle_transaction = "21/05/2020 || 2000.00 ||  || 3000.00\n"
    oldest_transaction = "21/05/2020 || 1000.00 ||  || 1000.00\n"
    statement = printed_header + newest_transaction + middle_transaction + oldest_transaction
    expect { account.print_statement }. to output(statement).to_stdout
  end
end
