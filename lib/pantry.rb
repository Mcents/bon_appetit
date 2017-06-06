require_relative 'recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(name)
    return 0 if nil?
    stock[name]
  end

  def restock(item, amount)
    stock[item] += amount
  end

  def convert_units(recipe)
    new_hash = a = Hash.new{ |h,k| h[k] = Hash.new(0)}
    recipe.ingredients.each do |key, value|
      if value < 1
        new_hash[key][:quantity] = (value * 1000)
        new_hash[key][:units] = "Milli-Units"
        # new_hash[value / 1000] = "Mili-Units"
      elsif value > 100
        new_hash[key][:quantity] = value / 100
        new_hash[key][:units] = "Centi-Units"
        # new_hash[value] = :quantity
        # new_hash[value / 100] = "Centi-Units"
      else
        new_hash[key][:quantity] = value
        new_hash[key][:units] = "Universal Units"
        # new_hash[value] = :quantity
        # new_hash[value] = "Universal-Units"
      end
    end
    new_hash
  end



end
