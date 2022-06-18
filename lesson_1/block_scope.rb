
# test = "test"

# [1, 2, 3].each do |x|
#   puts test 
# end 


# local variable name is avaiable to the Proc object
# but it is not avaialable within the calL_me method
# as it was not initiatlized there or passed in as an argument 


# def call_me(some_code)
#   some_code.call
# end


# chunk_of_code = Proc.new {puts "hi #{name}"}
# name = "Griffin III"        # re-assign name after Proc initialization

# call_me(chunk_of_code)


# p [2, 3, 5].inject(1, &:+)

p [2, 3, 5].inject(1) { |total, num| total + num }