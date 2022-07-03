# Write a program that takes a word and a list of possible anagrams and 
# selects the correct sublist that contains the anagrams of the word.

# For example, given the word "listen" and a list of candidates like "enlists", 
# "google", "inlets", and "banana", the program should return a list containing 
# "inlets". Please read the test suite for the exact rules of anagrams.


class Anagram 
  def initialize(word)
    @word = word.downcase
  end 

  def match(arr)
    sorted_letters = @word.chars.sort

    arr.select do |str| 
      str.downcase.chars.sort == sorted_letters &&
      @word != str.downcase
    end 
  end 
end 