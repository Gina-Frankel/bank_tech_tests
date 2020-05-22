require 'transaction'

describe Transaction do
  it 'when transaction is initialized with a default balance of 0'do
    transaction = Transaction.new(credit: nil, debit: nil)
    expect(transaction).to have_attributes(balance: 0)
  end 

  it 'when transaction can be initialized with credit value'do
    transaction = Transaction.new(credit: 50, debit: nil)
    expect(transaction).to have_attributes(credit: 50)
  end 


end
