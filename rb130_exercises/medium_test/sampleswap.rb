class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use! 

class TextTest < Minitest::Test
  def setup
    @file = File.open("./sample.txt", 'r')
    @text = Text.new(@file.read)
  end

  def test_swap
    original_text = @text.swap('a', 'a')
    swapped_text = @text.swap('a', 'e')

    refute_includes swapped_text.chars, 'a'
    assert_includes original_text.chars, 'a'
  end

  def test_word_count
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras sed vulputate ipsum.
    Suspendisse commodo sem arcu. Donec a nisi elit. Nullam eget nisi commodo, volutpat
    quam a, viverra mauris. Nunc viverra sed massa a condimentum. Suspendisse ornare justo
    nulla, sit amet mollis eros sollicitudin et. Etiam maximus molestie eros, sit amet dictum
    dolor ornare bibendum. Morbi ut massa nec lorem tincidunt elementum vitae id magna. Cras
    et varius mauris, at pharetra mi.
    TEXT

    assert_equal(expected_text.split.count, @text.word_count)
    assert_equal(72, @text.word_count)
  end

  def teardown 
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end


###
# Write a test for this new method. Make sure to utilize the setup and teardown methods for any file related operations.
###


# file = File.open("sample.txt", 'r')
# yield(file.read)
# file.close

# For this exercise you'll be given a sample text file and a starter class. 
# The sample text's contents will be saved as a String to an instance variable in the starter class.

# The Text class includes a #swap method that can be used to replace all 
# occurrences of one letter in the text with another letter. And for this 
# exercise we will swap all occurrences of 'a' with 'e'.

# # Your task is to write a test suite for class Text. In that test suite 
# write a test for the Text method swap. For this exercise, you are required 
# to use the minitest methods #setup and #teardown. The #setup method contains 
# code that will be executed before each test; #teardown contains code that will be executed after each test.