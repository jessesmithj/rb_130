# Write a program that manages robot factory settings.

# When robots come off the factory floor, they have no name. 
# The first time you boot them up, a random name is generated, such as RX837 or BC811.

# Every once in a while, we need to reset a robot to its factory settings, 
# which means that their name gets wiped. The next time you ask, it will respond with a new random name.

# The names must be random; they should not follow a predictable sequence. 
# Random names means there is a risk of collisions. Your solution should 
# not allow the use of the same name twice when avoidable.


# robots have no name at first 
# when you boot them up, a random name is generated, 2 alpha 3 numeric 
# sometimes, they need to be reset 
# when this happens, their name gets wiped and it will have a new random name 
# names must be totally random, cannot follow a predictible sequence 
# track names because there is a risk of collision - do not use name from list of names already used 


# generate rand name: 
# set name equal to empty string
# loop the following 
#   2 times choose random letter from ALPHA constant and push to name string 
#   3 times choose random number from NUM constnat and push to name string 
#   break if name is not included in class variable array names_used 
#   push name to class variable array names_used 
# end 


class Robot 
  @@names = []
  
  def self.names
    @@names
  end

  def name 
    return @name if @name

    @name = generate_name while @@names.include?(@name) || @name.nil?
    @@names << @name
    @name 
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end 

  private

  def generate_name
    new_name = ''
    2.times { |_| new_name << rand(65..90).chr }
    3.times { |_| new_name << rand(0..9).to_s }

    # @@names << new_name 
    new_name 
  end 
end




require 'minitest/autorun'
# require_relative 'robot_name'

class RobotTest < Minitest::Test
  DIFFERENT_ROBOT_NAME_SEED = 1234
  SAME_INITIAL_ROBOT_NAME_SEED = 1000

  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def test_has_name
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    p Robot.names
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    refute_equal name, name2
    assert_match NAME_REGEXP, name2
  end

  def test_different_name_when_chosen_name_is_taken
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name1 = Robot.new.name
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name2 = Robot.new.name
    refute_equal name1, name2
  end
end