require 'transaction'

describe Transaction do
  it 'when transaction is initialized it has attributes of date'do
    transaction = Transaction.new(credit:nil, debit: nil)
    expect(transaction).to have_attributes(:balance => 0)
  end 
end
