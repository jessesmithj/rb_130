# def call_address(some_code)
#   some_code.call
# end

# ls_address = "1234 Launch School Ave."
# chunk_of_code = Proc.new {puts "Address: #{ls_address}"}
# ls_address = "2345 Mastery Way" # re-assign address after Proc initialization

# call_address(chunk_of_code)



# implement each method

# arr = [1, 2, 3, 4, 5]
# arr2 = [0, 0, 0, 0, 0]

# def each(arr)
#   count = 0 
#   while count < arr.size
#     yield(arr[count]) if block_given?
#     count += 1
#   end 
#   arr
# end 

# p each(arr) { |i| puts i * 10 }
# p each(arr2)


# def method
#   "Jason"
# end

# name = "Robert"
# chunk_of_code = Proc.new {puts method}

# def some_method(something)
#   something.call
# end 

# p some_method(chunk_of_code)





# different in method def vs method invocaiton 
# def example_method(&arg1) # block -> proc
#   p arg1.call
# end

# example_method #{ "hello world" }

# proc1 = Proc.new { |x| x.to_i }

#p ['12', '3', '51'].sort_by(&proc1) # proc -> block (beacuse urnary & is used within method invocation proc to block 
# - and the  block is being yielded to)

# ['12', '3', '51'].sort_by(&:to_i)


# to proc is not covered in 130 but what we need to understand is that if its not a proc, it will try to convert it to a proc





# Given an array, find the minimum element based on some unknown criteria to be determined in the future.


# def max_by(arr)
#   max = arr[0] 
#   arr.each { |ele| max = ele if yield(max) < yield(ele) }
#   max
# end


# def min_by(arr)
#   min = arr[0]
#   min_val = yield(arr[0])
  
#   count = 0

#   while count < arr.size 
#     current_val = yield(arr[count])
#     count += 1
#     next unless current_val < min_val 
#     count -= 1
#     min = arr[count]
#     min_val = current_val
#     count += 1
#   end 

#   min
# end 


# def min_by(arr)
#   min = arr[0]
#   arr.each { |str| min = str if yield(min) > yield(str) }
#   min 
# end 


# arr = ['aall', 'aap', 'ark', 'bat', 'apple']

# p min_by(arr) { |str| str.size } # => "all"
# p min_by(arr) { |str| str.count("a") } # => app


# def explicit_block_test(&block)
#   puts "&block? = #{block.call}"
# end

# explicit_block_test { "This is an explicit block."}



# def test2(block)
#   puts "1"
#   block.call          # calls the block that was originally passed to test()
#   puts "2"
# end

# def test(&block)
#   puts "start"
#   test2(block)
#   puts "end"
# end

# test { |prefix| puts "calling the block that was converted to a Proc object" }
# # => start
# # => 1
# # => calling the block that was converted to a Proc object
# # => 2
# # => end


# # Lenient Arity 

# # method implementation
# def lenient_arity
#   yield("launch", "school")             # passing 2 block arguments at block invocation time
# end

# # method invocation
# lenient_arity { |str| puts str }        # expecting 1 parameter in block implementation

# # outputs 'launch'



# Lenient Arity 2

# # method implementation
# def test
#   yield(1)                              # passing 1 block argument at block invocation time
# end

# # method invocation
# test do |num1, num2|                    # expecting 2 parameters in block implementation
#   puts "#{num1} #{num2}"
# end


# def b_method(&expecting_a_block)
#   expecting_a_block.call
# end

# b_proc = proc {"I'm a block" }
# p b_method(&b_proc)



# # EX1 - IMPLEMENTATION, IMPLICIT BLOCK ARGUMENT WITH YIELD
# def a_method
#   yield
# end

# p a_method {"I'm a block in Example 1" }
# # =========================================================



# # EX2 - IMPLEMENTATION, BLOCK PARAMETER, EXPLICIT BLOCK
# def a_method(&expecting_a_block) # block is converted to a Proc object 
#   expecting_a_block.call # Proc object called inside method 
# end

# p a_method {"I'm a block in Example 2" }

# # =========================================================
    
# # EX3 - IMPLEMENTATION, BLOCK PARAMETER, EXPLICIT BLOCK, HOW TO PASS IN A PROC OBJECT WHEN EXPECTING A BLOCK
# def b_method(&expecting_a_block)
#   expecting_a_block.call
# end

# b_proc = proc {"I'm a block in Example 3" } # proc object initialized to local variable 
# p b_method(&b_proc)  # unary & with a proc converts the proc to a block where it is converted back to a proc in the method implemtnation 
#                      # the proc object is then called inside of the method implemntation on line 2

# # =========================================================

  
# # EX4 - IMPLEMENTATION, expecting_a_proc as a PARAMETER, PROC ARGUMENT, INVOKING Proc#call on ARGUMENT c_proc IN METHOD BODY
# def c_method(expecting_a_proc)
#   expecting_a_proc.call
# end
  
# c_proc = proc {"I'm a proc in Example 4" }
# p c_method(c_proc)


##########

# def a_method(&name)
#   name  # method returns a Proc object
# end 

# outside_name = a_method { "Johnny" }  # Proc assigned to local variable

# def b_method(proc_goes_here)
#   proc_goes_here.call # Proc assigned to local variable passed into method argument and then called here even though name woiuld normally be out of scope 
# end 

# p b_method(outside_name)



# def a_method(&blocky)
#   p yield 
#   p blocky.call 
# end 

# a_method { "Hotline bling" }



# class String 
#   def to_proc
#     Proc.new { |a| "friend" }
#   end 
# end 

# def a_method(&pro)
#   pro.call
# end

# a = 'friend'
# p a_method(&a)



# 29, **Why does the following code output `false`?**


# def some_method(block)
#   block_given?
# end

# bloc = proc { puts "hi" }

# p some_method("jesse", &bloc)

# The above code will output false because we are not  passing in a block, but a proc object.
#  If we prepend a unary ampersand  symbol `&` before the passed in argument on `line 393` 
#  and before the parameter variable `block` on `line 387` of `some_method` then the output will be `true`.


# def some()
#   yield
# end

# bloc = proc { p "hi" } # do not alter

# some(&bloc)

# why do we get localerror 
# how do we fix it (2 ways)


# we get a localjump error because we are yielding to a block (implicit) but we have no passed in an implciit block to the method

# to fix this, we can prepend the argument we pass into the some method inovcation with a unary &, which will convert the bloc Proc object 
# into a block and also palce unary & before the some method defintion arghument, which will convert the passed in block to a proc object, although we will not do anything with that proc object within the method 


# Questions: 

# how to specifically talk about closures and binding? 
  # - is there a closure without a binding? as in, are blocks/procs/lanmdas closures be default?
  # - is there a binding with no artifacts to bind to?

# what is the difference between a closure and a method? 

# A closure can be thought of as a method defined without an explicit name that can be passed around and executed within a program. 
  # how is this true for a proc that is defined with a local variable name? 
  # how is a block a chunk of code we can save and pass around for later? 

# unary & in method invocation is proc to block 
  # if it's not a proc, ruby will try to convert it to a proc? 
  # if that's true, why can we not deffine a custom to_proc method that works for strings for example?





# synbol to proc 
# def example(str)
#   puts yield(str)
# end 

# num = '1'
# example(num, &:to_i)
# example(num) { |x| x.to_i }


# to proc works for the following classes: 
# Symbol#to_proc
# Method#to_proc
# Hash#to_proc





# What are two use cases for blocks?


# sandwich code 


# def passing_time
#   start_time = Time.now
#   yield if block_given?
#   end_time = Time.now

#   puts "Wow! That only took #{end_time - start_time} seconds to complete."
# end

# passing_time { sleep(2) }



# p [1, 2, 3].inject { |acc, num| acc + num } 
# p [1,2,3].inject(10, :+)



# # What’s the arity of a method, with respect to non-block vs block arguments?

# Passing the incorrect number of non-block arguments raises an `ArgumentError` exception (due to **strict arity**). A passed block will always be accepted, but not necessarily used.

# Blocks have lenient arity, so any number of arguments can be passed to them. It ignores extra arguments and uses `nil` for omitted arguments.



