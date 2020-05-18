require 'account'

describe Account do
  it 'can register a new customer with their name' do
    account = Account.new 
    customer = Customer.new("John Smith")
    account.register(customer)
    expect(account.customer_name).to eq "John Smith"
  end
end