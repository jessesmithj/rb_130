# The Range#step method lets you iterate over a range of values where 
# each value in the iteration is the previous value plus a "step" value. It returns the original range.

# Write a method that does the same thing as Range#step, but does not 
# operate on a range. Instead, your method should take 3 arguments: 
# the starting value, the ending value, and the step value to be 
# applied to each iteration. Your method should also take a block 
# to which it will yield (or call) successive iteration values.


# i: starting value, ending value, step value 
# o: values between start and end value + start and end value 

# Algo:
# - set starting value equal to starting input value  
# - while step value is <= ending value
#   - yield starting value to block 
#   - increment value by step value 
#   - repeat until step value is over ending value 
# end 

def step(start, end_v, step)
  value = start
  while value <= end_v
    yield(value)
    value += step
  end 
  value - step
end 

j = step(1, 10, 3) { |value| puts "value = #{value}" }
p j
# step(0, 1000, 50) { |value| puts "value = #{value}" }
# step(0, 100, 100) { |value| puts "value = #{value}" }



# Ex: 

# step(1, 10, 3) { |value| puts "value = #{value}" }
# value = 1
# value = 4
# value = 7
# value = 10
