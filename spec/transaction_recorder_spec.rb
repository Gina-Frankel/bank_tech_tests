require 'transaction_recorder'

describe Transaction_recorder  do

  #process notes - this test should have been completed first
  it 'records default balance from initialisation as 0.00' do
    transaction_recorder = TransactionRecorder.new
    expect(transaction_recorder.record).to eq({ credit: nil, debit: nil, balance: '0.00', date: test_time })
  end

  it 'records the date when recording a transaction' do
    transaction_recorder = TransactionRecorder.new 

    test_time = Time.parse('2020-05-21 11:55:00 +0100 ')
    allow(Time).to receive(:now).and_return test_time
    
    # might caues other tests to break when connect .Account class
    expect(transaction_recorder.record).to eq({ credit: nil, debit: nil, balance: '0.00', date: '21/05/2020' })
  end 

  it 'records credit when recording a transaction with updated balance' do
    transaction_recorder = TransactionRecorder.new(balance: 500)

    expect(transaction_recorder.record(credit: 500)).to eq({ credit: '500.00', debit: nil, balance: '500.00', date: test_time })
  end

  it 'records debit when recording a transaction with updated balance' do
    transaction_recorder = TransactionRecorder.new(balance: 300)

    expect(transaction_recorder.record(debit: 20)).to eq({ credit: nil, debit: '20.00', balance: '300.00', date: test_time })
  end
 

end

def test_time
  Time.now.strftime('%d/%m/%Y')
end 

