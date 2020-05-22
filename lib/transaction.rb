class Transaction

  attr_reader :credit, :balance, :debit, :date
  def initialize(balance: 0, credit: nil , debit: nil)
    @credit = credit
    @debit = debit
    @balance = balance
    @date  = format_day_month_year(Time.now)
  end

  def format_day_month_year(time)
    time.strftime('%d/%m/%Y')
  end

  # can be module? 
  def add_pence(number)
    '%.2f' % number unless number.nil?
  end

end



