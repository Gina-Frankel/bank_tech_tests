require 'account'

context '#User prints statement of transactions' do
  it 'Customer can print statement' do

    test_time = Time.parse('2012-01-13')
    allow(Time).to receive(:now).and_return test_time

    account = Account.new
    account.deposit(50)
    account.withdraw(30)

    printed_header = "date || credit || debit || balance\n"
    newest_transaction = "13/01/2012 ||  || 30.00 || 20.00\n"
    oldest_transaction = "13/01/2012 || 50.00 ||  || 50.00\n"
    statement = printed_header + newest_transaction + oldest_transaction
    expect { account.print_statement }. to output(statement).to_stdout
  end
end
