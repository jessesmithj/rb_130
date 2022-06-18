# Write a program that takes a word and a list of possible 
# anagrams and selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates 
# like "enlists", "google", "inlets", and "banana", the program 
# should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.


# constructor: 
# -word stored as instance variable ot be used in match instance method 

# match:
# - array as argument 
# - set sorted_word = word as array sorted
# - iterate over array with an index 
# - select those words that, when sorted, are equal to our word 
# - return selected words as an array 


class Anagram 
  def initialize(word)
    @word = word.downcase
  end 

  def match(arr)
    sorted_letters = @word.chars.sort 

    arr.select do |ana|
      sorted_letters == ana.downcase.chars.sort &&
      @word != ana.downcase
    end 
  end
end 






require 'minitest/autorun'
# require_relative 'anagram'

class AnagramTest < Minitest::Test
  def test_no_matches
    detector = Anagram.new('diaper')
    assert_equal [], detector.match(%w(hello world zombies pants))
  end

  def test_detect_simple_anagram
    detector = Anagram.new('ant')
    anagrams = detector.match(%w(tan stand at))
    assert_equal ['tan'], anagrams
  end

  def test_detect_multiple_anagrams
    detector = Anagram.new('master')
    anagrams = detector.match(%w(stream pigeon maters))
    assert_equal %w(maters stream), anagrams.sort
  end

  def test_does_not_confuse_different_duplicates
    detector = Anagram.new('galea')
    assert_equal [], detector.match(['eagle'])
  end

  def test_identical_word_is_not_anagram
    detector = Anagram.new('corn')
    anagrams = detector.match %w(corn dark Corn rank CORN cron park)
    assert_equal ['cron'], anagrams
  end

  def test_eliminate_anagrams_with_same_checksum
    detector = Anagram.new('mass')
    assert_equal [], detector.match(['last'])
  end

  def test_eliminate_anagram_subsets
    detector = Anagram.new('good')
    assert_equal [], detector.match(%w(dog goody))
  end

  def test_detect_anagram
    detector = Anagram.new('listen')
    anagrams = detector.match %w(enlists google inlets banana)
    assert_equal ['inlets'], anagrams
  end

  def test_multiple_anagrams
    detector = Anagram.new('allergy')
    anagrams =
      detector.match %w( gallery ballerina regally clergy largely leading)
    assert_equal %w(gallery largely regally), anagrams.sort
  end

  def test_anagrams_are_case_insensitive
    detector = Anagram.new('Orchestra')
    anagrams = detector.match %w(cashregister Carthorse radishes)
    assert_equal ['Carthorse'], anagrams
  end
end
