class Transaction

  attr_reader :credit, :balance, :debit, :date
  def initialize(balance: 0, credit: , debit:)
    
    @credit = add_pence(credit)
    @debit = add_pence(debit) 
    @balance = add_pence(balance)
    @date  = Time.now
  end


# def display
#   date.strftime('%d/%m/%Y')
# end

  def format_day_month_year(time)
    time.strftime('%d/%m/%Y')
  end

  # can be module? 
  def add_pence(number)
    '%.2f' % number unless number.nil?
  end

end 



