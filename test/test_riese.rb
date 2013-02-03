require 'minitest/autorun'
require 'riese'
require 'turn'

class TestRiese < MiniTest::Unit::TestCase
  def test_that_assignment_is_stored_correctly
    subject = Riese::Fraction.new 1, 2
    assert_equal 1, subject.numerator
    assert_equal 2, subject.denominator
  end

  def test_that_2_fractions_with_same_values_are_equal
    subject = Riese::Fraction.new 1, 2
    assert_equal Riese::Fraction.new(1, 2), subject
  end

  def test_that_nil_is_unequal_to_fraction
    refute_equal Riese::Fraction.new(1, 2), nil
  end

  def test_that_fraction_is_reduced_correctly_for_simple_fraction
    assert_equal Riese::Fraction.reduced(2, 4), Riese::Fraction.new(1, 2)
  end

  def test_that_fraction_is_reduced_correctly_for_fraction_that_is_already_shortened
    assert_equal Riese::Fraction.reduced(1, 10), Riese::Fraction.new(1, 10)
  end

  def test_that_fraction_is_reduced_correctly_for_fraction_with_zero_as_numerator
    assert_equal Riese::Fraction.reduced(0, 100), Riese::Fraction.new(0, 100)
  end

  def test_that_addition_works_for_simple_fraction
    assert_equal Riese::Fraction.new(3, 4), Riese::Fraction.new(1, 2) + Riese::Fraction.new(1, 4)
  end

  def test_that_addition_works_for_addition_with_nil
    assert_equal Riese::Fraction.new(1, 2), Riese::Fraction.new(1, 2) + nil
  end
end