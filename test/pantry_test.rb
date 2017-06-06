require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pa = Pantry.new

    assert_instance_of Pantry, pa
  end

  def test_it_can_check_stock
    pa = Pantry.new
    expected = {}

    assert_equal expected, pa.stock
  end

  def test_it_can_stock_check
    pa = Pantry.new

    assert_equal 0, pa.stock_check("cheese")
  end

  def test_it_can_restock_food
    pa = Pantry.new
    pa.restock("Cheese", 10)
    pa.stock_check("Cheese")
    result = pa.restock("Cheese", 20)

    assert_equal 30, result
  end

  def test_conver_units
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)
    pa = Pantry.new
    result = pa.convert_units(r)

    assert_equal (ingredients = {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
    "Cheese"         => {quantity: 75, units: "Universal Units"},
    "Flour"          => {quantity: 5, units: "Centi-Units"}}), result
  end

  def test_it_can_shopping_list
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.ingredients
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r.ingredients
    pantry.add_to_shopping_list(r)
    expected = {"Cheese" => 20, "Flour" => 20}

    assert_equal expected, pantry.shopping_list

  end

  def test_it_can_shopping_list_twice
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.ingredients
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    r.ingredients
    pantry.add_to_shopping_list(r)

    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)
    expected = {"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}

    assert_equal expected, pantry.shopping_list
  end


end
