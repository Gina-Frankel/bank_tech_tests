class Transaction_recorder
  def initialize
    
  end

  def record(credit: credit)
    { credit: credit, debit: nil, balance: nil , date: date }
  end 

  def date 
    Time.now.strftime('%d/%m/%Y')
  end 
    
end 



