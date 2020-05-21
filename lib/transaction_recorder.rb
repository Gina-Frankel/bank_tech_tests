class TransactionRecorder
  attr_reader :balance
  def initialize(balance: 0)
    @balance = balance  
  end

  def record(credit: credit, debit: debit)
    { credit: add_pence(credit), debit: add_pence(debit), balance: add_pence(balance), date: format_day_month_year }
  end


  private

  def date
    Time.now
  end

  def format_day_month_year
    date.strftime('%d/%m/%Y')
  end

  def add_pence(amount)
    '%.2f' % amount unless amount.nil?
  end

end 



