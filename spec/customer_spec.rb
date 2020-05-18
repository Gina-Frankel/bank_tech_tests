require 'customer'
require 'bcrypt'

describe Customer do
  let(:name) {"John Smith"}
  it 'can set name' do
    customer = Customer.new(name, "password1")
    expect(customer.name).to eq name
  end
  context 'setting an encrypted password '
  it 'can set a passowrd' do
    customer = Customer.new(name, 'password1')
    expect(customer.password).to eq 'password1'
  end
  it 'the password is encrypted' do
    customer = Customer.new(name, 'password1')
    # need to set it to string else passwords will match even through the string is different
    encrypted_password = customer.password.to_str
    expect(encrypted_password).to_not eq 'password1'
  end

end

