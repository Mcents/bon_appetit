require_relative 'recipe'

class Pantry
  attr_reader :stock,
              :shop_list

  def initialize
    @stock = Hash.new(0)
    @shop_list = Hash.new(0)
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
      elsif value > 100
        new_hash[key][:quantity] = value / 100
        new_hash[key][:units] = "Centi-Units"
      else
        new_hash[key][:quantity] = value
        new_hash[key][:units] = "Universal Units"
      end
    end
    new_hash
  end

  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |key, value|
    shop_list[key] += value
  end
  end

  def shopping_list
    shop_list
  end


end
