# Write a minitest assertion that will fail if the value.odd? is not true.


 assert(value.odd?, "the value is not odd"


# Further Exploration 

# require 'minitest/autorun' 
# require "minitest/reporters" 
# Minitest::Reporters.use!

# class TestOdd 
#   attr_reader :value 

#   def initialize(value)
#     @value = value 
#   end 

#   def notodd?
#     !@value.odd?
#   end
# end

# class OddTest < MiniTest::Test
#   def setup 
#     @test_value = TestOdd.new(4)
#   end

#   def test_odd?
#     assert_equal(true, @test_value.notodd?)
#   end 
# end

