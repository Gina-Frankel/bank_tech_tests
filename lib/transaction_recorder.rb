class Transaction_recorder
  def initialize
    
  end

  def record
    { credit: nil, debit: nil, balance: nil , date: Time.now.strftime('%d/%m/%Y') }
  end 
end 



