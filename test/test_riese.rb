require 'minitest/autorun'
require 'riese'
require 'turn'

class TestRiese < MiniTest::Unit::TestCase
  def test_assignment
    subject = Riese::Fraction.new 1, 2
    assert_equal 1, subject.numerator
    assert_equal 2, subject.denominator
  end
end