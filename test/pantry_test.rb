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
    result = pa.stock_check("Cheese")

    assert_equal 10, result
  end


end
