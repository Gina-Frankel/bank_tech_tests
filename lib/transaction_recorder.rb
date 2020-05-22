class Transaction

  attr_reader :credit, :balance, :debit, :date
  def initialize(balance: 0, credit: , debit:)
    
    @credit = add_pence(credit)
    @debit = add_pence(debit) 
    @balance = add_pence(balance)
    @date  = format_day_month_year(Time.now)

   #@transaction = { credit: add_pence(credit), debit: add_pence(debit), balance: add_pence(balance), date: format_day_month_year }
  end

  private

# attributes have too many methods ? maybe display method and then send it back or move this to another class   
def display
  
end 



  def format_day_month_year(time)
    time.strftime('%d/%m/%Y')
  end

  # can be module? 
  def add_pence(number)
    '%.2f' % number unless number.nil?
  end

end 



