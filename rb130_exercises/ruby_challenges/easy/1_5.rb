

# Write a program that, given a word, computes the Scrabble score for that word.
# Sum the values of all the tiles used in each word. For instance, lets consider the word 
# CABBAGE which has the following letters and point values:

# case insensitive, test everything uppercase 
# nil = 0
# whitespace = 0 
# score can start at 0 

# - create Scrabble class 
# - create letter to value hash 

# constructor method: 
#   - set input to word instance vairable to be used for later 

# # Algo score: 
#   - set final_score = 0 
#   - iterate through chracters of word/input instance variable 
#   - pass current character to
#   - iterate through LETTER_VALUE hash 
#   - check to see if key includes (since key is an array) current character 
#   - if so score += value 
#   - return score when done iterating through word 


# Letter 	Value
# A, E, I, O, U, L, N, R, S, T 	1
# D, G 	2
# B, C, M, P 	3
# F, H, V, W, Y 	4
# K 	5
# J, X 	8
# Q, Z 	10


class Scrabble 
  attr_reader :word

  LETTER_VALUE = { 
    %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3, 
    %w(F H V W Y) => 4, 
    %w(K) => 5,
    %w(J X) => 8, 
    %w(Q Z) => 10
  }

  def initialize(word)
    @word = word ? word : ''
  end 

  def self.score(word)
    Scrabble.new(word).score
  end

  def score 
    final_score = 0 
    word.upcase.chars.each do |letter| 
      LETTER_VALUE.each do |key, value| 
        final_score += value if key.include?(letter)
      end
    end
    final_score
  end 
end



require 'minitest/autorun'
# require_relative 'scrabble_score'

class ScrabbleTest < Minitest::Test
  def test_empty_word_scores_zero
    assert_equal 0, Scrabble.new('').score
  end

  def test_whitespace_scores_zero
    assert_equal 0, Scrabble.new(" \t\n").score
  end

  def test_nil_scores_zero
    assert_equal 0, Scrabble.new(nil).score
  end

  def test_scores_very_short_word
    assert_equal 1, Scrabble.new('a').score
  end

  def test_scores_other_very_short_word
    assert_equal 4, Scrabble.new('f').score
  end

  def test_simple_word_scores_the_number_of_letters
    assert_equal 6, Scrabble.new('street').score
  end

  def test_complicated_word_scores_more
    assert_equal 22, Scrabble.new('quirky').score
  end

  def test_scores_are_case_insensitive
    assert_equal 41, Scrabble.new('OXYPHENBUTAZONE').score
  end

  def test_convenient_scoring
    assert_equal 13, Scrabble.score('alacrity')
  end
end