require 'customer'

describe Customer do
  it 'can set name' do  
    name = "John Smith"
    customer = Customer.new(name)
    expect(customer.name).to eq name
  end 
end