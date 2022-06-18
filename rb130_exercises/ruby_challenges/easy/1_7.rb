# Solution 1 

# class Octal
#   def initialize(input)
#     @input = is_valid?(input) ? 0 : input
#   end 

#   def to_decimal 
#     values = []
#     num_arr = @input.to_i.digits
#     return 0 if !(num_arr.select { |n| n > 7 }).empty?
    
#     num_arr.each_with_index { |d, i| values << d * (8**i) }
#     values.reduce(&:+)
#   end 

#   def is_valid?(input)
#     input.match?(/[A-Za-z]/)
#   end
# end


# Refactor 

class Octal
  attr_reader :input 

  def initialize(input)
    @input = input
  end 

  def to_decimal 
    return 0 unless valid_octal?(input)

    new_num = 0 
    num_arr = input.to_i.digits
    
    num_arr.each_with_index { |num, i| new_num += num * (8**i) }
    new_num
  end 

  private 

  def valid_octal?(num)
    num.chars.all? {|n| n =~ /[0-7]/}
  end
end


require 'minitest/autorun'
# require_relative 'octal'

class OctalTest < Minitest::Test
  def test_octal_1_is_decimal_1
    assert_equal 1, Octal.new('1').to_decimal
  end

  def test_octal_10_is_decimal_8
    assert_equal 8, Octal.new('10').to_decimal
  end

  def test_octal_17_is_decimal_15
    assert_equal 15, Octal.new('17').to_decimal
  end

  def test_octal_11_is_decimal_9
    assert_equal 9, Octal.new('11').to_decimal
  end

  def test_octal_130_is_decimal_88
    assert_equal 88, Octal.new('130').to_decimal
  end

  def test_octal_2047_is_decimal_1063
    assert_equal 1063, Octal.new('2047').to_decimal
  end

  def test_octal_7777_is_decimal_4095
    assert_equal 4095, Octal.new('7777').to_decimal
  end

  def test_octal_1234567_is_decimal_342391
    assert_equal 342_391, Octal.new('1234567').to_decimal
  end

  def test_invalid_octal_is_decimal_0
    assert_equal 0, Octal.new('carrot').to_decimal
  end

  def test_8_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('8').to_decimal
  end

  def test_9_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('9').to_decimal
  end

  def test_6789_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('6789').to_decimal
  end

  def test_abc1z_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('abc1z').to_decimal
  end

  def test_valid_octal_formatted_string_011_is_decimal_9
    assert_equal 9, Octal.new('011').to_decimal
  end

  def test_234abc_is_seen_as_invalid_and_returns_0
    assert_equal 0, Octal.new('234abc').to_decimal
  end
end