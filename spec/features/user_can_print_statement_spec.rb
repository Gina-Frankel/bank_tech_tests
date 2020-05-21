require'account'

context '#User prints statement of transactions' do
  it 'Customer can print statement' do
    # Set  up
    test_time = Time.parse('2012-01-13')
    allow(Time).to receive(:now).and_return test_time

  
    # exersise - the behaviour of the user in IRB
    account = Account.new
    account.deposit(50)
    account.withdraw(30)

      # To make the expect statement more readable
      printed_header = "date || credit || debit || balance\n"
      newest_transaction = "13/01/2012 ||  || 30.00 || 20.00\n"
      oldest_transaction = "13/01/2012 || 50.00 ||  || 50.00\n"
    expect { account.print_statement }. to output(printed_header + newest_transaction + oldest_transaction).to_stdout
  end
end
