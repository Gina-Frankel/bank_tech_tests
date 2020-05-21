class Transaction_recorder
  attr_reader :balance
  def initialize(balance:0)
    @balance = balance
    
  end

  def record(credit: credit, debit: debit)
    { credit: format_money(credit), debit: format_money(debit), balance: format_money(balance), date: format_day_month_year }
  end 

  def date 
    Time.now
  end 

  def format_day_month_year
    date.strftime('%d/%m/%Y')
  end 

  def format_money(amount)
    '%.2f' % amount if amount != nil 
  end 

 
end 



