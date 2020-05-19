class Printer
  def initialize
    
  end

  def print_statement(statement)
    puts "date || credit || debit || balance"
    statement.reverse!
    statement.each do |transaction|
      puts "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}"
    end 
  end 
end