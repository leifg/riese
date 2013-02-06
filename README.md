# Riese

DISCLAIMER: This gem doesn't claim to be a mathematic correct implementation. If you need a implementation of fraction in ruby, checkout the [Rational](http://www.ruby-doc.org/core/Rational.html) library shipped with ruby.

## Purpose

This library is solely for the purpose to demonstrate a couple of programming paradigms to newcomers:

 - Basic OOP
 - Mutability/Immutability
 - TDD using Minitest
 - BDD using RSpec

### Object Oriented Programming

This library only consists of one class `Riese::Fraction`. This class is a representation of a fraction. You can initialize it with a numerator and a denominator. It implements the following (public) instance methods:

 - + (addition)
 - - (subtraction)
 - * (multiplication)
 - / (division)
 - inverse
 - to_s
 - ==

It has one class method:

 - init (makes sure the inputted value is converted to fraction)

Additionally there are 2 private methods:

 - normalize (takes care of reducing the fraction and making sure that negative fractions only have a negative numerator)
 - gcd (Euclidean algorithm for determing the greatest common divisor)

If used for explanation these 2 methods can be treated as a black box.

### Mutability/Immutability

The underlying instance variables are only set once. All actions on the instance will never change these variables and always return a new instance of fractions.

### TDD using Minitest

For testing the functionality of the Fraction [minitest/unit](https://github.com/seattlerb/minitest) is used. I believe that for a total beginner the assert-Syntax is easier to understand. So all the functionality is tested using this framework.

### BDD using RSpec

The same tests that have been implemented using minitest, are also available as examples in [RSpec](http://rspec.info). So for people that already have a background in OOP or Test::Unit syntax, this might be useful.

## Limits

- Currently it is not possible to normalize fractions with a fload numerator or denominator
- the used algorithm for determing the greatest common divisor produces a SystemStackError very fast (try initalize the fraction 1/10000)