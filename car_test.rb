require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'car'

class CarTest < MiniTest::Test
  def test_wheels
    car = Car.new
    # assert(23 == car.wheels)
    assert(4 == car.wheels)
  end
  
  def test_bad_wheels
    car = Car.new
    assert_equal("4", car.wheels)
  end
end