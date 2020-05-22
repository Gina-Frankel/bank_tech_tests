require 'statement'

xdescribe Statement do
  it 'statement can add pence to numbers' do
    statement = Statement.new(balance: 0, credit: nil , debit: nil) 
    
    expect(statement.add_pence(50)).to eq '50.00'
  end 

end