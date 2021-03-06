

class Printer

  attr_reader  :transaction
  def initialize; end

  def print(statement)
    print_header
    print_body(statement)
  end

  def print_header
    puts 'date || credit || debit || balance'
  end

  def print_body(statement)
    statement.each do |transaction|
      puts "#{transaction.date} || #{transaction.credit} || #{transaction.debit} || #{transaction.balance}"
    end
  end
end
