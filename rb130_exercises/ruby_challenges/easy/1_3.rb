# - create a RomanNumerals class 
# - constructor method accepts an argument and assigns instance variable to an integer be used for later 
# - method to_roman needed, which will convert our number to a roman numeral 
#   - create a hash to lookup what the roman numberal should be 
#   -  I, V, X, L, C, D, M
#   

# do for 1-10 for now

# if number == 1990 
#   1000
#   900
#   90
  


# Wikipedia says: Modern Roman numerals ... 
# are written by expressing each digit 
# separately starting with the left most 
# digit and skipping any digit with a value of zero.

# 1990 is MCMXC

# 1000=M
# 900=CM
# 90=XC

# 2008 is written as MMVIII:

# 2000=MM
# 8=VIII

# - Only need to solve up to 3000
# - We need to first figure out which place value the digit is at 
# - From there, we convert, so if there is a 2 in the 1000s place digit, it will be MM 
# - if there is a zero in a place digit, we skip it completely 
# - if the digit is a 4 or a 9, we need to select the current roman numberal + the next roman numeral
#   - for example, if the number is 9, we need to select 'I' + 'X'
#   - if the number is 400, we need to select 'C' & 'D'


# - Initialize a variable with an empty string to save the finished Roman conversion.
# - Iterate over the Roman Numerals collection:
#     If the numeric value of the current Roman numeral is less than the value of the input number, 
#     add the Roman numerals to the string as many times as its value can fit. 
#     For instance, if the current Roman numeral is C (which has a value of 100) 
#     and the input number is 367, then 3 C's are needed: CCC.
# - Subtract the numeric value of the added Roman numerals from the current input value, 
#   and use the new input value in subsequent iterations. For instance, since we added CCC 
#   to the string above, we must subtract 300 from 367, leaving us with a new input number of 67.
#   Return the result string.


# class RomanNumeral 
#   attr_reader :number

#   ROMAN_NUMERALS = {
#     "M" => 1000,
#     "CM" => 900,
#     "D" => 500,
#     "CD" => 400,
#     "C" => 100,
#     "XC" => 90,
#     "L" => 50,
#     "XL" => 40,
#     "X" => 10,
#     "IX" => 9,
#     "V" => 5,
#     "IV" => 4,
#     "I" => 1
#   }

#   def initialize(number)
#     @number = number
#   end

#   def to_roman
#     roman_version = ''
#     to_convert = number

#     ROMAN_NUMERALS.each do |key, value|
#       multiplier, remainder = to_convert.divmod(value)
#       if multiplier > 0
#         roman_version << (key * multiplier)
#       end
#       to_convert = remainder
#     end
#     roman_version
#   end
# end

OTHER SOLUTIONS

# class RomanNumeral
#   HUNDREDS = ['', "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"] 
#   TENS = ['', 'X','XX','XXX', 'XL', 'L', 'LX', 'LXX', 'LXXX', 'XC'] 
#   ONES = ['', 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X']

#   def initialize(num)
#     arr = [0,0,0,0]
#     num.digits.reverse.each do |el|
#       arr << el 
#       arr.shift 
#     end 
#     @arr = arr 
#     @roman = []
#   end 

#   def to_roman 
#     @arr.each_with_index do |num, ind|
#       @roman << 'M' * num if ind == 0 
#       case ind 
#       when 1 
#         @roman << HUNDREDS[num]
#       when 2 
#         @roman << TENS[num]
#       when 3 
#         @roman << ONES[num] 
#       end
#     end 
#     @roman.join 
#   end 
# end 


# class RomanNumeral
#   NUMERALS_ONES      = %w(I II III IV V VI VII VIII IX)
#   NUMERALS_TENS      = %w(X XX XXX XL L LX LXX LXXX XC)
#   NUMERALS_HUNDREDS  = %w(C CC CCC CD D DC DCC DCCC CM)
#   NUMERALS_THOUSANDS = %w(M MM MMM)

#   def initialize(num)
#     @num = num
#   end

#   def to_roman
#     ones, tens, hundreds, thousands = @num.digits.map { |n| n == 0 ? nil : n }
#     ones      &&= NUMERALS_ONES[ones - 1]
#     tens      &&= NUMERALS_TENS[tens - 1]
#     hundreds  &&= NUMERALS_HUNDREDS[hundreds - 1]
#     thousands &&= NUMERALS_THOUSANDS[thousands - 1]
#     "#{thousands}#{hundreds}#{tens}#{ones}"
#   end
# end


require 'minitest/autorun'
# require_relative 'roman_numerals'

class RomanNumeralsTest < Minitest::Test
  def test_1
    number = RomanNumeral.new(1)
    assert_equal 'I', number.to_roman
  end

  def test_2
    number = RomanNumeral.new(2)
    assert_equal 'II', number.to_roman
  end

  def test_3
    number = RomanNumeral.new(3)
    assert_equal 'III', number.to_roman
  end

  def test_4
    number = RomanNumeral.new(4)
    assert_equal 'IV', number.to_roman
  end

  def test_5
    number = RomanNumeral.new(5)
    assert_equal 'V', number.to_roman
  end

  def test_6
    number = RomanNumeral.new(6)
    assert_equal 'VI', number.to_roman
  end

  def test_9
    number = RomanNumeral.new(9)
    assert_equal 'IX', number.to_roman
  end

  def test_27
    number = RomanNumeral.new(27)
    assert_equal 'XXVII', number.to_roman
  end

  def test_48
    number = RomanNumeral.new(48)
    assert_equal 'XLVIII', number.to_roman
  end

  def test_59
    number = RomanNumeral.new(59)
    assert_equal 'LIX', number.to_roman
  end

  def test_93
    number = RomanNumeral.new(93)
    assert_equal 'XCIII', number.to_roman
  end

  def test_141
    number = RomanNumeral.new(141)
    assert_equal 'CXLI', number.to_roman
  end

  def test_163
    number = RomanNumeral.new(163)
    assert_equal 'CLXIII', number.to_roman
  end

  def test_402
    number = RomanNumeral.new(402)
    assert_equal 'CDII', number.to_roman
  end

  def test_575
    number = RomanNumeral.new(575)
    assert_equal 'DLXXV', number.to_roman
  end

  def test_911
    number = RomanNumeral.new(911)
    assert_equal 'CMXI', number.to_roman
  end

  def test_1024
    number = RomanNumeral.new(1024)
    assert_equal 'MXXIV', number.to_roman
  end

  def test_3000
    number = RomanNumeral.new(3000)
    assert_equal 'MMM', number.to_roman
  end
end








#####

# ROM = {    1 => 'I',
# 4 => 'IV',
# 5 => 'V',
# 6 => 'VI',
# 7 => 'VII',
# 8 => 'VIII',
# 9 => 'IX',
# 10 => 'X',
# 1000 => 'M'