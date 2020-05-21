require 'transaction_recorder'

describe Transaction_recorder  do
  it 'records the date when recording a transaction' do
    transaction_recorder = Transaction_recorder.new 
    test_time = Time.parse('2012-01-13')
    allow(Time).to receive(:now).and_return test_time
    deposit = 50

    # might caues other tests to break when connect .Account class
    expect(transaction_recorder.record).to eq({ credit: nil, debit: nil, balance: nil, date: '13/01/2012' })
  end 
end


# it 'records  time in the first columns' do
#   account = Account.new
#   test_time = Time.parse('2012-01-13')
#   allow(Time).to receive(:now).and_return test_time

#   account.deposit(50)

#   expect(account.statement).to eq([{ credit: 50, balance: 50, date: '13/01/2012' }])
# end