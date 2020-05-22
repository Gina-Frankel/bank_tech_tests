require 'transaction'

describe Transaction do
  it 'can format time' do
    transaction = Transaction.new(balance: 0, credit: nil, debit: nil)
    test_time = Time.parse('2020-05-21 11:55:00 +0100 ')
    allow(Time).to receive(:now).and_return test_time

    expect(transaction.format_day_month_year(test_time)).to eq '21/05/2020'
  end

  it 'can add pence' do
    transaction = Transaction.new(balance: 0, credit: nil, debit: nil)

    expect(transaction.add_pence(50)).to eq '50.00'
  end
end
