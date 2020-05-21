class Transaction_recorder
  attr_reader :balance
  def initialize(balance = 0)
    @balance = balance
    
  end

  def record(credit: credit)
    { credit: credit, debit: nil, balance: '%.2f' % balance , date: date }
  end 

  def date 
    Time.now.strftime('%d/%m/%Y')
  end 
    
end 



