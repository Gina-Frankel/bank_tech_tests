class Customer
  attr_reader :name, :password
  def initialize(name, password)
    @name = name
    @password = password
  end
end