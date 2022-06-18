# Clock

# Create a clock that is independent of date.

# You should be able to add minutes to and subtract minutes
# from the time represented by a given clock object. Two clock 
# objects that represent the same time should be equal to each other.

# You may not use any built-in date or time functionality; just
# use arithmetic operations.

# def time_conversion(mins)
#   hours, minutes = mins.divmod(60)
#   sprintf('%d:%02d', hours, minutes)
# end


# at method 
  # - if one number, multiple number * 60 then divmod that value by 60
  # - if two numbers mulitple first number by 60 then add second number and divmod that value by 60
  # - format together to find current time (this can be what the to_s function does)








require 'minitest/autorun'
# require_relative 'clock'

class ClockTest < Minitest::Test
  def test_on_the_hour
    assert_equal '08:00', Clock.at(8).to_s
    assert_equal '09:00', Clock.at(9).to_s
  end

  def test_past_the_hour
    assert_equal '11:09', Clock.at(11, 9).to_s
  end

  def test_add_a_few_minutes
    clock = Clock.at(10) + 3
    assert_equal '10:03', clock.to_s
  end

  def test_subtract_fifty_minutes
    clock = Clock.at(0) - 50
    assert_equal '23:10', clock.to_s
  end

  def test_add_over_an_hour
    clock = Clock.at(10) + 61
    assert_equal '11:01', clock.to_s
  end

  def test_wrap_around_at_midnight
    clock = Clock.at(23, 30) + 60
    assert_equal '00:30', clock.to_s
  end

  def test_add_more_than_a_day
    clock = Clock.at(10) + 3061
    assert_equal '13:01', clock.to_s
  end

  def test_subtract_a_few_minutes
    clock = Clock.at(10, 30) - 5
    assert_equal '10:25', clock.to_s
  end

  def test_subtract_minutes
    clock = Clock.at(10) - 90
    assert_equal '08:30', clock.to_s
  end

  def test_wrap_around_at_negative_midnight
    clock = Clock.at(0, 30) - 60
    assert_equal '23:30', clock.to_s
  end

  def test_subtract_more_than_a_day
    clock = Clock.at(10) - 3061
    assert_equal '06:59', clock.to_s
  end

  def test_equivalent_clocks
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 37)
    assert_equal clock1, clock2
  end

  def test_inequivalent_clocks
    clock1 = Clock.at(15, 37)
    clock2 = Clock.at(15, 36)
    clock3 = Clock.at(14, 37)
    refute_equal clock1, clock2
    refute_equal clock1, clock3
  end

  def test_wrap_around_backwards
    clock1 = Clock.at(0, 30) - 60
    clock2 = Clock.at(23, 30)
    assert_equal clock1, clock2
  end
end






#####

# First Working Solution 

# class Clock
#   def initialize(hours, minutes=0)
#     @time_in_minutes = hours + minutes

#     if @time_in_minutes <= 0 
#       @time_in_minutes += 1440 until @time_in_minutes >= 0
#     else 
#       @time_in_minutes %= 1440 until @time_in_minutes <= 1440 
#     end
#   end

#   def self.at(*num)
#    time_arr = num
   
#   if time_arr.size > 1 
#     hours = time_arr[0] * 60
#     minutes = time_arr[1]
#   else
#     hours = time_arr[0] * 60
#     minutes = 0  
#   end  

#     Clock.new(hours, minutes)
#   end

#   def +(num)
#     @time_in_minutes += num
#     hours, minutes = @time_in_minutes.divmod(60)
#     Clock.at(hours, minutes)
#   end 

#   def -(num)
#     @time_in_minutes -= num
#     hours, minutes = @time_in_minutes.divmod(60)
#     Clock.at(hours, minutes)
#   end

#   def to_s
#     hours, minutes = @time_in_minutes.divmod(60)
#     sprintf('%02d:%02d', hours, minutes)
#   end

#   def == (other)
#     self.to_s == other.to_s
#   end
# end
