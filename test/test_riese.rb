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

  def test_zero_is_correctly_reduced_on_initialization
    subject = Riese::Fraction.new 0, 99
    assert_equal 0, subject.numerator
    assert_equal 1, subject.denominator
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

  def test_that_addition_raises_error_on_adding_nil
    assert_raises(TypeError) {assert_equal Riese::Fraction.new(1, 2), Riese::Fraction.new(1, 2) + nil}
  end

  def test_that_zero_denominator_raises_error
    assert_raises(ZeroDivisionError) {Riese::Fraction.new(1, 0)}
  end
end