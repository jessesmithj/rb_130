# Write a program that, given a natural number and a set of one or more other numbers, 
# can find the sum of all the multiples of the numbers in the set that are less than the first number. 
# If the set of numbers is not given, use a default set of 3 and 5.

# For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of 
# either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.



# 1 up tp one less than given input
# how many numbers are multiples of either 3 or 5
# OR another set of numbers we pass in 

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples 
  end 

  def self.to(limit)
    SumOfMultiples.new(3, 5).find_sum(limit)
  end 

  def to(limit)
    self.find_sum(limit)
  end 

  def find_sum(limit)
    divisors = []
    return 0 if limit < 2

    (1...limit).each do |n| 
      @multiples.each do |mult| 
        divisors << n if n % mult == 0 
      end 
    end 

    divisors.uniq.sum
  end 
end