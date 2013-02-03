require 'riese/version'

module Riese
  class Fraction
    attr_reader :numerator, :denominator

    def initialize numerator, denominator
      @numerator = numerator
      @denominator = denominator
    end

    def == other
      other && self.numerator == other.numerator && self.denominator == other.denominator
    end

    def + other
      to_add = other.nil? ? Fraction.new(0, 1) : other
      self.class.reduced self.numerator * to_add.denominator + to_add.numerator * self.denominator, self.denominator * to_add.denominator
    end

    def self.reduced numerator, denominator
      gcd = self.gcd numerator, denominator
      if [0, 1].include? numerator
        Fraction.new(numerator, denominator)
      else
        Fraction.new(numerator/gcd, denominator/gcd)
      end
    end

    private
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