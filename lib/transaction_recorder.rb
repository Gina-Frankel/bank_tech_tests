class Transaction_recorder
  attr_reader :balance
  def initialize(balance = 0)
    @balance = balance
    
  end

  def record(credit: credit)
    { credit: credit, debit: nil, balance: format_money(balance) , date: date }
  end 

  def date 
    Time.now.strftime('%d/%m/%Y')
  end 

  def format_money(amount)
    '%.2f' % amount
  end 

 
end 



