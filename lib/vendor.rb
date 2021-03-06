class Vendor
  attr_reader :name, :inventory

  def initialize(name)
    @name = name
    @inventory = Hash.new(0)
  end

  def check_stock(stock)
    @inventory[stock]
  end

  def stock(stock, quantity)
    @inventory[stock] += quantity
  end
end
