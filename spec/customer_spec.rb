require 'customer'

describe Customer do
  let(:name) {"John Smith"}
  it 'can set name' do
    customer = Customer.new(name, "password1")
    expect(customer.name).to eq name
  end
  it 'can set an encrypted password' do
    customer = Customer.new(name, 'password1')
    expect(customer.password).to_not eq 'password1'
  end
  it 'can match an encrypted password' do
    customer = Customer.new(name, 'password1')
    encrypted_password = Password.new(customer.password)
    encrypted_password == 'password1'
  end

end

