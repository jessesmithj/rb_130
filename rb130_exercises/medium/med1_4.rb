
# birds = %w(raven finch hawk eagle)
# p birds # => ['raven','finch','hawk','eagle']

# raven, finch, hawk, eagle = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p hawk # => 'hawk'
# p eagle # => 'eagle'


# Suppose we want to organize our array contents into groups, where variables represent category names. 
# Can we do that without extracting items directly from the array based on their indices?

# We can use the splat operator(*) to do something like this:

# raven, finch, *raptors = %w(raven finch hawk eagle)
# p raven # => 'raven'
# p finch # => 'finch'
# p raptors  # => ['hawk','eagle']



# Based on the examples shown above, write a method that takes an array as an argument. 
# The method should yield the contents of the array to a block, which should assign your 
# block variables in such a way that it ignores the first two elements, 
# and groups all remaining elements as a raptors array.


# My solution 

# array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

# def raptors(arr)
#   yield(arr)
# end

# raptors(array) do |first, second, *rest| 
#   puts "Raptors: #{rest}"
# end

# Refactored 


test_array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 0]

def raptors(arr)
  yield(arr)
end

raptors(test_array) { |_, _, *rest| puts "Raptors: #{rest}" }
