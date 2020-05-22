require 'printer'

describe Printer do

    printer = Printer.new
    it ' prints a withhrawal transaction' do
      time = Time.now
      date = time.strftime('%d/%m/%Y')
      transaction = instance_double(
        'Transaction',
        {
          date: date,
          balance: '50.00',
          credit: '50.00',
          debit: nil
        }
      )
      statement = [transaction]
   
      printed_header = "date || credit || debit || balance\n"
      row = "#{Time.now.strftime('%d/%m/%Y')} || 50.00 ||  || 50.00\n"
      expect { printer.print(statement) }. to output(printed_header + row).to_stdout
  end
end


