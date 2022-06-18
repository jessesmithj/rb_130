
# Write a method that takes a sorted array of integers as an argument, and returns an array 
# that includes all of the missing integers (in order) between the first and last elements of the argument.

# input: sorted array of integers 
# output: array that includes all of the missing integers in asending order 
# array to solve the problem 

# negative and positive integers 

# set result to empty array
# iterate through range of numbers, first in array to last in array 
# if number is in array do not add it to result 
# if nubmer is in array, add it to result
# return result 

def missing(arr)
  result = []
  (arr.first..arr.last).each do |i| 
    result << i if !arr.include?(i)
  end
  result
end

# no iterating/block 

def missing(arr)
  (arr.first..arr.last).to_a - arr
end


# LS 
# def missing(array)
#   result = []
#   array.each_cons(2) do |first, second|
#     p result.concat(((first + 1)..(second - 1)).to_a)
#   end
#   result
# end


p missing([-3, -2, 1, 5]) #== [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) #== []
p missing([1, 5]) #== [2, 3, 4]
p missing([6]) #== []