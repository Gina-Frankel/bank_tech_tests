require 'transaction_recorder'

describe Transaction  do


  it  'can format time' do
    transaction = Transaction.new 
    test_time = Time.parse('2020-05-21 11:55:00 +0100 ')
    allow(Time).to receive(:now).and_return test_time

    expect(transaction.format_day_month_year(test_time)).to eq '21/05/21'
  end



  

