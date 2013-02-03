require 'riese/version'

module Riese
  class Fraction
    attr_reader :numerator, :denominator

    def initialize numerator, denominator
      raise ZeroDivisionError if denominator == 0
      @numerator, @denominator = self.class.normalize numerator, denominator
    end

    def + other
      self.class.validate! other
      Fraction.new self.numerator * other.denominator + other.numerator * self.denominator, self.denominator * other.denominator
    end

    def == other
      other && self.numerator == other.numerator && self.denominator == other.denominator
    end

    def to_s
      "(#{numerator}/#{denominator})"
    end

    private
    def self.normalize first, second
      gcd = self.gcd first, second
      [first/gcd, second/gcd]
    end

    def self.validate! fraction
      raise TypeError, 'nil can\'t be coerced into Fraction' if fraction.nil? 
    end

    #Euclidean algorithm for determing the greatest common divisor (see http://en.wikipedia.org/wiki/Euclidean_algorithm for details)
    def self.gcd first, second
      return first if second == 0
      return second if first == 0
      if first > second
        self.gcd first - second, second
      else
        self.gcd first, second - first
      end
    end
  end
end