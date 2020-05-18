require 'bcrypt'

class Customer 
  attr_reader :name, :password
  def initialize(name, password)
    @name = name
    @password = password_encryptor(password)
  end
  def password_encryptor(password)
    @password = BCrypt::Password.create(password, :cost => 5)
  end 
end