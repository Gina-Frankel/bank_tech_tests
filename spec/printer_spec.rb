require 'printer'

describe Printer do

    printer = Printer.new
    it ' rints a withdrawal transaction' do

      transaction = instance_double(
        'Transaction',
        {
          #Was not sure how time should be written here 
          # - should I be emulating methods of transaction class or just give the return value
          date: Time.parse('2020-05-21 11:55:00 +0100 ').strftime('%d/%m/%Y'),
          balance: '50.00',
          credit: '50.00',
          debit: nil
        }
      )
      statement = [transaction]
   
      printed_header = "date || credit || debit || balance\n"
      row = "21/05/2020 || 50.00 ||  || 50.00\n"
      expect { printer.print(statement) }. to output(printed_header + row).to_stdout
  end
end



