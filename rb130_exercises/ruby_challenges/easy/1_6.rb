# The Greek mathematician Nicomachus devised a classification scheme for 
# natural numbers (1, 2, 3, ...), identifying each as belonging uniquely to 
# the categories of abundant, perfect, or deficient based on a comparison between 
# the number and the sum of its positive divisors (the numbers that can be evenly 
# divided into the target number with no remainder, excluding the number itself). 
# For instance, the positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

#   Perfect numbers have an Aliquot sum that is equal to the original number.
#   Abundant numbers have an Aliquot sum that is greater than the original number.
#   Deficient numbers have an Aliquot sum that is less than the original number.

# Examples:

# 6  is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
# 28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
# 15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
# 24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
# Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

# Write a program that can tell whether a number is perfect, abundant, or deficient.

# - create a class method 
# - raise StandardError if num is below 0
# - find what all divisors of input number 
  # - set divisors equal to empty array 
  # - iterate over a range of numbers between 1 and num/2
  # - check to see if num modulo input_num is 0
  # - if so push to divisors array  
# - find if sum of divisors is equal to input number 
#   - if so, number is perfect 
# - elsif number is lower than input number 
#   - number is deicient 
# - if neither, number is abundant 





class PerfectNumber
  def self.classify(num)
    raise StandardError if num < 1
    sum = factors(num).reduce(&:+)
    
    return 'perfect' if sum == num
    return 'deficient' if sum < num
    'abundant'
  end 

  class << self
    private

    def factors(num)
      (1..num/2).select { |i| num % i == 0 }
    end 
  end
end 





require 'minitest/autorun'
# require_relative 'perfect_numbers'

class PerfectNumberTest < Minitest::Test
  def test_initialize_perfect_number
    assert_raises StandardError do
      PerfectNumber.classify(-1)
    end
  end

  def test_classify_deficient
    assert_equal 'deficient', PerfectNumber.classify(13)
  end

  def test_classify_perfect
    assert_equal 'perfect', PerfectNumber.classify(28)
  end

  def test_classify_abundant
    assert_equal 'abundant', PerfectNumber.classify(12)
  end

  def test_classify_perfect2
    assert_equal 'perfect', PerfectNumber.classify(8128)
  end 
end


###
# Divisor can be any number with which you want to divide another number (dividend).
# A factor however is a divisor that divides the number and leaves no remainder.
# So all factors of a number are its divisors. But not all divisors will be factors.