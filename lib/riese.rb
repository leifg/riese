require 'riese/version'

module Riese
  class Fraction
    attr_reader :numerator, :denominator

    def initialize numerator, denominator
      @numerator = numerator
      @denominator = denominator
    end
  end
end