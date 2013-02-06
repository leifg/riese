require 'riese/version'

module Riese
  class Fraction
    attr_reader :numerator, :denominator

    def initialize numerator, denominator
      raise ZeroDivisionError if denominator == 0
      @numerator, @denominator = self.class.normalize numerator, denominator
    end

    def + other
      other = self.class.init other
      Fraction.new self.numerator * other.denominator + other.numerator * self.denominator, self.denominator * other.denominator
    end

    def - other
      other = self.class.init other
      self + other * -1
    end

    def * other
      other = self.class.init other
      Fraction.new self.numerator * other.numerator, self.denominator * other.denominator
    end

    def / other
      other = self.class.init other
      self * other.inverse
    end

    def == other
      other && self.numerator == other.numerator && self.denominator == other.denominator
    end

    def to_s
      "(#{numerator}/#{denominator})"
    end

    def inverse
      Fraction.new self.denominator, self.numerator
    end

    def self.init input
      raise TypeError, 'nil can\'t be coerced into Fraction' if input.nil?
      return input if input.is_a? Fraction
      return Fraction.new input, 1
    end

    private
    def self.normalize numerator, denominator
      if denominator < 0
        numerator = numerator * -1
        denominator = denominator * -1
      end
      gcd = self.gcd numerator.abs, denominator
      [numerator/gcd, denominator/gcd]
    end

    #Euclidean algorithm for determing the greatest common divisor (see http://en.wikipedia.org/wiki/Euclidean_algorithm for details)
    def self.gcd first, second
      return first if second <= 0
      return second if first <= 0
      if first > second
        self.gcd first - second, second
      else
        self.gcd first, second - first
      end
    end
  end
end