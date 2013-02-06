require 'rspec'
require 'riese'

describe Riese::Fraction do
  describe '#initialize' do
    it 'should assign instance variables correctly' do
      subject = Riese::Fraction.new 1, 2
      expect(subject.numerator).to be(1)
      expect(subject.denominator).to be(2)
    end

    it 'should reduce fraction correctly' do
      subject = Riese::Fraction.new 30, 90
      expect(subject.numerator).to be(1)
      expect(subject.denominator).to be(3)
    end

    it 'should reduce fraction correctly for zero' do
      subject = Riese::Fraction.new 0, 99
      expect(subject.numerator).to be(0)
      expect(subject.denominator).to be(1)
    end

    it 'should normalize negative fraction correctly' do
      subject = Riese::Fraction.new 1, -2
      expect(subject.numerator).to be(-1)
      expect(subject.denominator).to be(2)
    end

    it 'should normalize negative numerator and denominator correctly' do
      subject = Riese::Fraction.new -10, -20
      expect(subject.numerator).to be(1)
      expect(subject.denominator).to be(2)
    end

    it 'should raise ZeroDivisionError on zero denominator' do
      expect{Riese::Fraction.new(1, 0)}.to raise_error(ZeroDivisionError)
    end
  end

  describe 'Riese::Fraction.init' do
    it 'should initalize correctly from integer' do
      expect(Riese::Fraction.init(23)).to eq(Riese::Fraction.new(23, 1))
    end

    it 'should raise TypeError on nil' do
      expect{Riese::Fraction.init(nil)}.to raise_error(TypeError)
    end
  end

  describe '#==' do
    it 'should recognize 2 fractions with the same numerator and denominator as equal' do
      subject = Riese::Fraction.new 1, 2
      expect(subject).to eq(Riese::Fraction.new(1, 2))
    end

    it 'should recognize 2 fractions with the same value as equal' do
      subject = Riese::Fraction.new 20, 100
      expect(subject).to eq(Riese::Fraction.new(1, 5))
    end

    it 'should recognize nil and fraction as unequal' do
      expect(Riese::Fraction.new(1, 2)).not_to eq(nil)
    end
  end

  describe '#inverse' do
    it 'should inverse simple fraction correctly' do
      expect(Riese::Fraction.new(1, 100).inverse).to eq(Riese::Fraction.new(100, 1))
    end

    it 'should raise ZeroDivisionError on inverse of zero' do
      expect{Riese::Fraction.new(0, 100).inverse}.to raise_error(ZeroDivisionError)
    end
  end

  describe '#+' do
    it 'should add 2 simple fractions correctly' do
      expect(Riese::Fraction.new(1, 2) + Riese::Fraction.new(1, 4)).to eq(Riese::Fraction.new(3, 4))
    end

    it 'should add integer correctly' do
      expect(Riese::Fraction.new(1, 2) + 2).to eq(Riese::Fraction.new(5, 2))
    end

    it 'should raise TypeError on adding nil' do
      expect{Riese::Fraction.new(1, 2) + nil}.to raise_error(TypeError)
    end
  end

  describe '#-' do
    it 'should subtract 2 simple fractions correctly' do
      expect(Riese::Fraction.new(1, 10) - Riese::Fraction.new(1, 20)).to eq(Riese::Fraction.new(1, 20))
    end

    it 'should subtract integer correctly' do
      expect(Riese::Fraction.new(1, 2) - 1).to eq(Riese::Fraction.new(-1, 2))
    end

    it 'should raise TypeError on subtracting nil' do
      expect{Riese::Fraction.new(3, 4) - nil}.to raise_error(TypeError)
    end
  end

  describe '#*' do
    it 'should multiply 2 simple fractions correctly' do
      expect(Riese::Fraction.new(2, 3) * Riese::Fraction.new(4, 5)).to eq(Riese::Fraction.new(8, 15))
    end

    it 'should multiply integer correctly' do
      expect(Riese::Fraction.new(2, 3) * 2).to eq(Riese::Fraction.new(4, 3))
    end

    it 'should multiply negative integer correctly' do
      expect(Riese::Fraction.new(2, 3) * -2).to eq(Riese::Fraction.new(-4, 3))
    end

    it 'should raise TypeError on multiplying by nil' do
      expect{Riese::Fraction.new(5, 6) * nil}.to raise_error(TypeError)
    end
  end

  describe '#/' do
    it 'should divide 2 simple fractions correctly' do
      expect(Riese::Fraction.new(1, 4) / Riese::Fraction.new(1, 2)).to eq(Riese::Fraction.new(1, 2))
    end

    it 'should divide integer correctly' do
      expect(Riese::Fraction.new(1, 10) / 2).to eq(Riese::Fraction.new(1, 20))
    end

    it 'should raise ZeroDivisionError on dividing by zero' do
      expect{Riese::Fraction.new(1, 2) / 0}.to raise_error(ZeroDivisionError)
    end

    it 'should raise TypeError on divifing by nil' do
      expect{Riese::Fraction.new(7, 8) / nil}.to raise_error(TypeError)
    end
  end
end