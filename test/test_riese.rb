require 'minitest/autorun'
require 'riese'
require 'turn'

class TestRiese < MiniTest::Unit::TestCase
  def test_that_assignment_is_stored_correctly
    subject = Riese::Fraction.new 1, 2
    assert_equal 1, subject.numerator
    assert_equal 2, subject.denominator
  end

  def test_that_fraction_is_reduced_on_initialization
    subject = Riese::Fraction.new 30, 90
    assert_equal 1, subject.numerator
    assert_equal 3, subject.denominator
  end

  def test_that_zero_is_correctly_reduced_on_initialization
    subject = Riese::Fraction.new 0, 99
    assert_equal 0, subject.numerator
    assert_equal 1, subject.denominator
  end

  def test_that_negative_fraction_is_correctly_normalized
    subject = Riese::Fraction.new 1, -2
    assert_equal -1, subject.numerator
    assert_equal 2, subject.denominator
  end

  def test_that_negative_numerator_and_denominator_are_correctly_normalized
    subject = Riese::Fraction.new -10, -20
    assert_equal 1, subject.numerator
    assert_equal 2, subject.denominator
  end

  def test_initialization_from_integer
    assert_equal Riese::Fraction.new(23, 1), Riese::Fraction.init(23)
  end

  def test_initialization_from_nil
    assert_raises(TypeError) {Riese::Fraction.init(nil)}
  end

  def test_that_2_fractions_with_same_numerator_denumerator_are_equal
    subject = Riese::Fraction.new 1, 2
    assert_equal Riese::Fraction.new(1, 2), subject
  end

  def test_that_2_fractions_with_the_same_value_are_equal
    subject = Riese::Fraction.new 1, 5
    assert_equal Riese::Fraction.new(20, 100), subject
  end

  def test_that_nil_is_unequal_to_fraction
    refute_equal Riese::Fraction.new(1, 2), nil
  end

  def test_that_fraction_is_reduced_correctly_for_simple_fraction
    assert_equal Riese::Fraction.new(2, 4), Riese::Fraction.new(1, 2)
  end

  def test_that_inverse_for_simple_fraction_works_correctly
    assert_equal Riese::Fraction.new(100, 1), Riese::Fraction.new(1, 100).inverse
  end

  def test_that_inverse_for_zero_raises_error
    assert_raises(ZeroDivisionError){ Riese::Fraction.new(0, 100).inverse }
  end

  def test_that_fraction_is_reduced_correctly_for_fraction_that_is_already_shortened
    assert_equal Riese::Fraction.new(1, 10), Riese::Fraction.new(1, 10)
  end

  def test_that_zero_is_reduced_correctly
    assert_equal Riese::Fraction.new(0, 1), Riese::Fraction.new(0, 100)
  end

  def test_that_one_is_reduced_correctly
    assert_equal Riese::Fraction.new(1, 1), Riese::Fraction.new(100, 100)
  end

  def test_that_addition_works_for_simple_fraction
    assert_equal Riese::Fraction.new(3, 4), Riese::Fraction.new(1, 2) + Riese::Fraction.new(1, 4)
  end

  def test_that_addition_works_for_integer
    assert_equal Riese::Fraction.new(5, 2), Riese::Fraction.new(1, 2) + 2
  end

  def test_that_subtraction_works_for_simple_fraction
    assert_equal Riese::Fraction.new(1, 20), Riese::Fraction.new(1, 10) - Riese::Fraction.new(1, 20)
  end

  def test_that_subtraction_works_for_integer
    assert_equal Riese::Fraction.new(-1, 2), Riese::Fraction.new(1, 2) - 1
  end

  def test_that_multiplication_works_for_simple_fraction
    assert_equal Riese::Fraction.new(8, 15), Riese::Fraction.new(2, 3) * Riese::Fraction.new(4, 5)
  end

  def test_that_multiplication_works_for_integer
    assert_equal Riese::Fraction.new(4, 3), Riese::Fraction.new(2, 3) * 2
  end

  def test_that_multiplication_works_for_negative_integer
    assert_equal Riese::Fraction.new(-4, 3), Riese::Fraction.new(2, 3) * -2
  end

  def test_that_division_works_for_integer
    assert_equal Riese::Fraction.new(1, 20), Riese::Fraction.new(1, 10) / 2
  end

  def test_that_addition_raises_error_on_adding_nil
    assert_raises(TypeError) { Riese::Fraction.new(1, 2) + nil }
  end

  def test_that_zero_denominator_raises_error
    assert_raises(ZeroDivisionError) { Riese::Fraction.new(1, 0) }
  end
end