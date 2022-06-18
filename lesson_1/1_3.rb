# def echo_with_yield(str)
#   yield if block_given?
#   puts str
# end

# # echo_with_yield("hello!") { print "world" }    
# echo_with_yield("hello!")


# def say(words)
#   yield if block_given?
#   puts "> " + words
# end

# say("hi there") do
#   system 'clear'
# end



# def increment(num)
#   if block_given?
#     yield(num + 1)
#   else
#     num + 1
#   end
# end

# increment(5) do |num|
#   puts num
# end


# def test
#   yield(1)                           # passing 2 block arguments at block invocation time
# end

# test { |num1, num2| puts "#{num1} #{num2} test" }    


# def compare(str)
#   puts "Before: #{str}"
#   after = yield(str)
#   puts "After: #{after}"
# end

# compare("hi") { |word| word.upcase }
# compare('hello') { |word| word.slice(1..2) }
# compare('hello') { |word| "nothing to do with anything" }
# compare('hello') { |word| puts "hi" }



# def time_it
#   time_before = Time.now
#   yield
#   time_after= Time.now

#   puts "It took #{time_after - time_before} seconds."
# end

# time_it { sleep(3) }
# time_it { "hello world" }  


# def test(&block)
#   puts "What's &block? #{block}"
# end

# test { sleep(1) }

##


# def test2(block)
#   puts "hello"
#   block.call          # calls the block that was originally passed to test()
#   puts "good-bye"
# end

# def test(&block)
#   puts "1"
#   test2(block)
#   puts "2"
# end

# test { |prefix| puts "xyz" }
# # => 1
# # => hello
# # => xyz
# # => good-bye
# # => 2


###
# Building an Integer times method: 
###

# 5.times do |num|
#   puts num
# end

# Output 

# 0
# 1
# 2
# 3
# 4
# => 5


# def times(number)
#   counter = 0 
#   while counter < number
#     yield(counter)
#     counter += 1 
#   end
#   number
# end


# times(5) do |num|
#   puts num
# end


# times(3) { |num| puts "#{num}.learning about blocks" }



###
# Building an Array each method
###



# [1, 2, 3].each { |num| "do nothing" } # still returns [1, 2, 3]

# def each(array)
#   counter = 0 
#   while counter < array.size
#     yield(array[counter]) 
#     counter += 1 
#   end 

#   array
# end

# p each([1, 2, 3, 4, 5]) { |n| puts "do nothing" }.select{ |num| num.odd? } # chaining the select method


###
# Building an Array select method
###

# Note that the Array#select method takes a block, then yields each element to the block. 
# If the block evaluates to true, the current element will be included in the returned array. 
# If the block evaluates to false, the current element will not be included in the returned array.

# array = [1, 2, 3, 4, 5]

# array.select { |num| num.odd? }       # => [1, 3, 5]
# array.select { |num| puts num }       # => [], because "puts num" returns nil and evaluates to false
# array.select { |num| num + 1 }        # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true


# def select(array)
#   counter = 0 
#   result = [] 

#   while counter < array.size 
#     current_element = array[counter]
#     result << current_element if yield(current_element)
#     counter += 1 
#   end

#   result
# end

# array = [1, 2, 3, 4, 5]

# p select(array) { |num| num.odd? }      # => [1, 3, 5]
# p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
# p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true


###
# Building an Array reduce method
###

# [1, 2, 3].reduce do |acc, num|
#   acc + num
# end

# => 6

# Remember what the reduce method does: it sets the accumulator to the return value of the block, 
# and then passes the accumulator to the block on the next yield.

# Try to write a reduce method on your own that exhibits this behavior. 
# Your reduce should take at least 1 argument that represents the array we'll operate on. 
# It should also take an optional second argument that represents the default value for 
# the accumulator. Here's a few examples that we should be able to call on your method.


# def reduce(arr, default=0)
#   accumlator = default 
#   counter = 0 

#   while counter < arr.size 
#     accumlator = yield(accumlator, arr[counter])
#     counter += 1 
#   end 

#   accumlator
# end 


# array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass


## new and improved reduce 


# def reduce(arr, default=arr[0])
#   accumlator = default 
#   counter = 1

#   while counter < arr.size 
#     accumlator = yield(accumlator, arr[counter])
#     counter += 1 
#   end 

#   accumlator
# end

# p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
# p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']


# def reduce(arr, default=arr[0].class.new)
#   accumlator = default 
#   counter = 0 

#   while counter < arr.size 
#     accumlator = yield(accumlator, arr[counter])
#     counter += 1 
#   end 

#   accumlator
# end

# p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
# p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']

