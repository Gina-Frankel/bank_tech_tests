require 'transaction'

describe Transaction do
  
  it 'when transaction is initialized with a default balance of 0' do
    transaction = Transaction.new()
    expect(transaction).to have_attributes(balance: 0)
  end

  it 'transaction can be initialized with given credit value' do
    transaction = Transaction.new(credit: 50)
    expect(transaction).to have_attributes(credit: 50)
  end

  it 'transaction can be initialized with given debit value' do
    transaction = Transaction.new(debit: 100)
    expect(transaction).to have_attributes(debit: 100)
  end

  it ' transaction will be initialized with time value' do
    test_time = Time.now
    allow(Time).to receive(:now).and_return(test_time)
    transaction = Transaction.new()
   

    expect(transaction).to have_attributes(time: test_time)
  end

end

# could also test that class can know  it's attributes 