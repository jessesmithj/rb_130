
# Sum of Multiples

# Write a program that, given a natural number and a set of one or more other numbers, 
# can find the sum of all the multiples of the numbers in the set that are less than 
# the first number. If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that 
# are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.

# SumOfMultiples class 
# class method .to that takes one argument 
# initialize instance method that takes one argument, a set of numbers 
# find all numbers that are multiples of 3 or 5 up to the input number (to method)
# however, if a set of multiples is given use those instead of 3 & 5 


#Solution 1 

# class SumOfMultiples 
#   attr_reader :multiples 

#   def initialize(*b)
#     @multiples = b
#   end 

#   def to(num)
#     divisors = [] 

#     (1...num).each do |n| 
#       multiples.each do |divisor| 
#         divisors << n if n % divisor == 0
#       end 
#     end 

#     divisors.uniq.sum 
#   end 

#   def self.to(num)
#     divisors = [] 

#     (1...num).each do |n| 
#       [3, 5].each do |divisor| 
#         divisors << n if n % divisor == 0
#       end 
#     end 

#     divisors.uniq.sum 
#   end 
# end 

# Refactor 

class SumOfMultiples 
  attr_reader :multiples 

  def self.to(limit)
    SumOfMultiples.new(3, 5).to(limit)
  end 

  def initialize(*multiples)
    @multiples = multiples
  end 

  def to(limit)
    find_sum(limit, multiples)
  end 

  private

  def find_sum(limit, arr)
    (1...limit).each_with_object([]) do |n, divisors| 
      arr.each do |divisor| 
        divisors << n if n % divisor == 0
      end 
    end.uniq.sum
  end
end 


# divisors = [] 

# (1...num).each do |n| 
#   arr.each do |divisor| 
#     divisors << n if n % divisor == 0
#   end 
# end 

# divisors.uniq.sum 
# end 


require 'minitest/autorun'
# require_relative 'sum_of_multiples'

class SumTest < Minitest::Test
  def test_sum_to_1
    assert_equal 0, SumOfMultiples.to(1)
  end

  def test_sum_to_3
    assert_equal 3, SumOfMultiples.to(4)
  end

  def test_sum_to_10
    assert_equal 23, SumOfMultiples.to(10)
  end

  def test_sum_to_100
    assert_equal 2_318, SumOfMultiples.to(100)
  end

  def test_sum_to_1000
    assert_equal 233_168, SumOfMultiples.to(1000)
  end

  def test_configurable_7_13_17_to_20
    assert_equal 51, SumOfMultiples.new(7, 13, 17).to(20)
  end

  def test_configurable_4_6_to_15
    assert_equal 30, SumOfMultiples.new(4, 6).to(15)
  end

  def test_configurable_5_6_8_to_150
    assert_equal 4419, SumOfMultiples.new(5, 6, 8).to(150)
  end

  def test_configurable_43_47_to_10000
    assert_equal 2_203_160, SumOfMultiples.new(43, 47).to(10_000)
  end
end