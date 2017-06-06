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
    new_hash = {}
    recipe.ingredients.each do |key, value|
      if value < 1
        new_hash[value / 1000] = "Mili-Units"
      elsif value > 100
        new_hash[value / 100] = "Centi-Units"
      else
        new_hash[value] = "Universal-Units"
      end
    end
    new_hash
  end

  # def convert_units(recipe)
  #   recipe.ingredients.each_key do |key|
  #     if ingredients[value] < 1
  #       value/1000 && key == "Mili-Units"
  #     elsif ingredients[value] > 100
  #       value/100 && key == "Centi-Units"
  #     else
  #       ingredients[value] = value && key = "Universal-Units"
  #     end
  #   end
  #   recipe
  # end

end
