class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(name)
    return 0 if nil?
    stock[name]
  end


end
