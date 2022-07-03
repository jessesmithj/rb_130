# Write a program that will take a string of digits and return all the possible consecutive number 
# series of a specified length in that string.

# For example, the string "01234" has the following 3-digit series:

#     012
#     123
#     234

# Likewise, here are the 4-digit series:

#     0123
#     1234

# Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.



# Series class
# initialize an instnace variable num to an the input given


# slices instance method: 
# i: integer number series of a specificed length
# o: nested array of possible consecutive number series of a specififed length in a string 

# examples: 
# "123" 
# slices: 1 
# [[1], [2], [3]]

# '457632'
# slices 3 
# [[4,5,7], [5,7,6], [7,6,3], [6,3,2]]

# raise ArgumentError if input is greater than size of the string 

# data: array 

# Algo:
# - set result = []
# - iterate through an array of digits - created when we instantiate a new Series object 

# - slice_len -= 1 
# - @digits_array[0..num.length] 

# - usually want to iterate from 0 to one less than string length 
# - however, we want to iterate to string length minus slice_len 
# - exmaple: if string length is 5 and slice_len is 2 
#   - [0, 1, 2, 3, 4]
#   - we want to iterate from @digits[0] to digits[3] 
#     - digits length(5) - slice_len(2) to get 3

# class Series 
#   def initialize(str)
#     @digits = str.chars.map(&:to_i)
#   end 

#   def slices(slice_len) 
#     raise ArgumentError if slice_len > @digits.size

#     result = []
#     end_range = @digits.size - slice_len

#     @digits[0..end_range].each_with_index do |_, idx|
#       result << @digits[idx..(idx + (slice_len - 1))]
#     end 

#     result 
#   end 
# end


