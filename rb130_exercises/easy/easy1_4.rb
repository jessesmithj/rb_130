# Write a method that returns a list of all of the divisors of the positive integer passed 
# in as an argument. The return value can be in any sequence you wish.

# i: positive integer 
# o: array of all divisors of input 

# 
# From 1 to input integer/2, iterate through numbers 
# check to see if input integer modulo of current interation is 0 
# if it is, pass to result 
# return result 

# def divisors(int)
#   (1..int/2).select { |i| int % i == 0 }
# end

# def divisors(int)
#   result = (1..int/2).select { |i| int % i == 0 }
#   result << int
# end

# faster version
# def divisors(n) 
#   return [1] if n == 1 
#   divisors = []

#   (1..Math.sqrt(n)) do |num|
#     if n / num if n % num == 0
#       divisors << num
#       divisors << n / num
#     end
#   end.sort
#   divisors.sort
# end 


# faster version
def divisors(n) 
  return [1] if n == 1 
  (1..Math.sqrt(n)).each_with_object([]) do |num, divisors|
    divisors << num && divisors << n / num if n % num == 0
  end
  .sort
end 

# p divisors(999962000357)

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) #== [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute