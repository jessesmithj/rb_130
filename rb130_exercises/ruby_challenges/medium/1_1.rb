# The diamond exercise takes as its input a letter, and outputs it in a diamond shape. 
# Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

# The first row contains one 'A'.
# The last row contains one 'A'.
# All rows, except the first and last, have exactly two identical letters.
# The diamond is horizontally symmetric.
# The diamond is vertically symmetric.
# The diamond has a square shape (width equals height).
# The letters form a diamond shape.
# The top half has the letters in ascending order.
# The bottom half has the letters in descending order.
# The four corners (containing the spaces) are triangles.


# I: string, which represents the widest point alphabetically 
# O: string in diamong shape,  starting with letter 'A' and ending with letter 'A'


# anything that is not the first/last part of the diamond 'A'
# should have blank space equal to one odd level down from current iteraion 

# - iterate through odd numbers 1 to hash map of alpha to (number -1) * 2 + 1 
# - iterate through alphabet 

# diamond = []
# - if 1 , push "A" to diamond
# - else push to diamond array - letter + ' ' * current num iteration - 2 + letter + \n
# return diamond.join (half diamond)


# first solution

class Diamond 
  ALPHA_TO_NUM = ("A".."Z").zip(0..25).to_h
  
  def self.make_diamond(letter)
    first_half = []
    space = 1
    width = determine_width(letter)

    ("A"..letter).to_a.each do |char| 
      if char == "A"
        first_half << "A".center(width) + "\n"
        break if letter == "A"
      else
        first_half << (char + (' ' * space) + char).center(width) + "\n"
        space += 2  
      end
    end
    
    remaining = first_half.dup.reverse[1..-1]
    diamond = first_half + remaining
    diamond.join
  end

  private

  def self.determine_width(letter)
    ALPHA_TO_NUM[letter] * 2 + 1
  end 
end 


require 'minitest/autorun'
# require_relative '10_diamond'

class DiamondTest < Minitest::Test
  def test_letter_a
    answer = Diamond.make_diamond('A')
    assert_equal "A\n", answer
  end

  def test_letter_b
    answer = Diamond.make_diamond('B')
    assert_equal " A \nB B\n A \n", answer
  end

  def test_letter_c
    answer = Diamond.make_diamond('C')
    string = "  A  \n"\
             " B B \n"\
             "C   C\n"\
             " B B \n"\
             "  A  \n"
    assert_equal string, answer
  end

  def test_letter_e
    answer = Diamond.make_diamond('E')
    string = "    A    \n"\
             "   B B   \n"\
             "  C   C  \n"\
             " D     D \n"\
             "E       E\n"\
             " D     D \n"\
             "  C   C  \n"\
             "   B B   \n"\
             "    A    \n"
    assert_equal string, answer
  end
end



#FIRST SOLUTION 

# class Diamond 
#   ALPHA_NUM = ("A".."Z").zip(1..26).to_h
  
#   def self.make_diamond(letter) 
#     diamond = []
#     space = 1
#     width = (ALPHA_NUM[letter] - 1) * 2 + 1

#     ("A"..letter).to_a.each do |char| 
#       if space > 1
#         diamond << (char + ' ' * (space - 2) + "#{char}").center(width) + "\n"
#       else
#         diamond << "A".center(width) + "\n"
#         break unless letter > "A"
#       end
#       space += 2  
#     end

#     diamond.dup.reverse[1..-1].each { |section| diamond << section }
#     diamond.join
#   end
# end 