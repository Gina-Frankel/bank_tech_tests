require 'printer'

describe Printer do
  it 'Customer can print statement' do
    printer = Printer.new
    statement = [
      { credit: 50, balance: 50, date: '13/01/2012' },
      { debit: 30, balance: 20, date: '13/01/2012' }
    ]
    printed_header = "date || credit || debit || balance\n"
    oldest_transaction = "13/01/2012 || 50 ||  || 50\n"
    newest_transaction = "13/01/2012 ||  || 30 || 20\n"
    expect { printer.print_statement(statement) }. to output(printed_header + newest_transaction + oldest_transaction).to_stdout
  end
end
