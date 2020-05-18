require 'customer'

describe Customer do
  let(:name) {"John Smith"}
  it 'can set name' do
    customer = Customer.new(name, "password1")
    expect(customer.name).to eq name
  end
  it 'can set password' do
    customer = Customer.new(name, 'password1')
    expect(customer.password).to eq 'password1'
  end
end
