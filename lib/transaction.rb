class Transaction

  attr_reader :credit, :balance, :debit, :time 
  def initialize(balance: 0, credit: nil , debit: nil )
    @credit = credit
    @debit = debit
    @balance = balance
    @time  = Time.now
  end

  def format_day_month_year(time)
    time.strftime('%d/%m/%Y')
  end

  # can be module? 
  def add_pence(number)
    '%.2f' % number unless number.nil?
  end

end



