# Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.

class BeerSong 
  def self.verse(bottles)
    case bottles
    when 0
      zero_bottle_verse
    when 1
      single_bottle_verse
    when 2
      two_bottle_verse
    else
      default_verse(bottles)
    end
  end

  def self.verses(start, stop)
    all_lyrics = ''

    start.downto(stop).to_a.each do |line| 
      if line > stop
        all_lyrics << verse(line) + "\n"
      else 
        all_lyrics << verse(line)
      end
    end
    
    all_lyrics
  end

  def self.lyrics
    verses(99, 0)
  end

  private

  def self.default_verse(bottles)
    "#{bottles} bottles of beer on the wall, #{bottles}" +
    " bottles of beer.\nTake one down and pass it around, " +
    "#{bottles-1} bottles of beer on the wall.\n"
  end

  def self.two_bottle_verse
    "2 bottles of beer on the wall, 2 bottles of beer.\n" +
    "Take one down and pass it around, 1 bottle of beer " +
    "on the wall.\n"
  end

  def self.single_bottle_verse
    "1 bottle of beer on the wall, 1 bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer " +
    "on the wall.\n"
  end

  def self.zero_bottle_verse
    "No more bottles of beer on the wall, no more bottles " +
    "of beer.\nGo to the store and buy some more, 99 bottles " +
    "of beer on the wall.\n"
  end
end 




#LS

# class Verse
#   attr_reader :bottles

#   def initialize(bottles)
#     @bottles = bottles
#   end

#   def single_verse
#     case bottles
#     when 0
#       zero_bottle_verse
#     when 1
#       single_bottle_verse
#     when 2
#       two_bottle_verse
#     else
#       default_verse
#     end
#   end

#   private

#   def default_verse
#     "#{bottles} bottles of beer on the wall, #{bottles}" +
#     " bottles of beer.\nTake one down and pass it around, " +
#     "#{bottles-1} bottles of beer on the wall.\n"
#   end

#   def two_bottle_verse
#     "2 bottles of beer on the wall, 2 bottles of beer.\n" +
#     "Take one down and pass it around, 1 bottle of beer " +
#     "on the wall.\n"
#   end

#   def single_bottle_verse
#     "1 bottle of beer on the wall, 1 bottle of beer.\n" +
#     "Take it down and pass it around, no more bottles of beer " +
#     "on the wall.\n"
#   end

#   def zero_bottle_verse
#     "No more bottles of beer on the wall, no more bottles " +
#     "of beer.\nGo to the store and buy some more, 99 bottles " +
#     "of beer on the wall.\n"
#   end
# end

# class BeerSong
#   def self.verse(number)
#     Verse.new(number).single_verse
#   end

#   def self.verses(start, stop)
#     current_verse = start
#     result = []

#     while current_verse >= stop
#       result << "#{verse(current_verse)}"
#       current_verse -= 1
#     end

#     result.join("\n")
#   end

#   def self.lyrics
#     verses(99, 0)
#   end
# end



require 'minitest/autorun'
# require_relative 'beer_song'

# rubocop:disable Metrics/LineLength
class BeerSongTest < Minitest::Test
  def test_the_first_verse
    expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(99)
  end

  def test_another_verse
    expected = "3 bottles of beer on the wall, 3 bottles of beer.\n" \
      "Take one down and pass it around, 2 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(3)
  end

  def test_verse_2
    expected = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(2)
  end

  def test_verse_1
    expected = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(1)
  end

  def test_verse_0
    expected = "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verse(0)
  end

  def test_a_couple_verses
    expected = "99 bottles of beer on the wall, 99 bottles of beer.\n" \
      "Take one down and pass it around, 98 bottles of beer on the wall.\n" \
      "\n" \
      "98 bottles of beer on the wall, 98 bottles of beer.\n" \
      "Take one down and pass it around, 97 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verses(99, 98)
  end

  def test_a_few_verses
    expected = "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
      "\n" \
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n" \
      "\n" \
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    assert_equal expected, BeerSong.verses(2, 0)
  end

  def test_the_whole_song # rubocop:disable Metrics/MethodLength
    expected = <<-SONG
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

98 bottles of beer on the wall, 98 bottles of beer.
Take one down and pass it around, 97 bottles of beer on the wall.

97 bottles of beer on the wall, 97 bottles of beer.
Take one down and pass it around, 96 bottles of beer on the wall.

96 bottles of beer on the wall, 96 bottles of beer.
Take one down and pass it around, 95 bottles of beer on the wall.

95 bottles of beer on the wall, 95 bottles of beer.
Take one down and pass it around, 94 bottles of beer on the wall.

94 bottles of beer on the wall, 94 bottles of beer.
Take one down and pass it around, 93 bottles of beer on the wall.

93 bottles of beer on the wall, 93 bottles of beer.
Take one down and pass it around, 92 bottles of beer on the wall.

92 bottles of beer on the wall, 92 bottles of beer.
Take one down and pass it around, 91 bottles of beer on the wall.

91 bottles of beer on the wall, 91 bottles of beer.
Take one down and pass it around, 90 bottles of beer on the wall.

90 bottles of beer on the wall, 90 bottles of beer.
Take one down and pass it around, 89 bottles of beer on the wall.

89 bottles of beer on the wall, 89 bottles of beer.
Take one down and pass it around, 88 bottles of beer on the wall.

88 bottles of beer on the wall, 88 bottles of beer.
Take one down and pass it around, 87 bottles of beer on the wall.

87 bottles of beer on the wall, 87 bottles of beer.
Take one down and pass it around, 86 bottles of beer on the wall.

86 bottles of beer on the wall, 86 bottles of beer.
Take one down and pass it around, 85 bottles of beer on the wall.

85 bottles of beer on the wall, 85 bottles of beer.
Take one down and pass it around, 84 bottles of beer on the wall.

84 bottles of beer on the wall, 84 bottles of beer.
Take one down and pass it around, 83 bottles of beer on the wall.

83 bottles of beer on the wall, 83 bottles of beer.
Take one down and pass it around, 82 bottles of beer on the wall.

82 bottles of beer on the wall, 82 bottles of beer.
Take one down and pass it around, 81 bottles of beer on the wall.

81 bottles of beer on the wall, 81 bottles of beer.
Take one down and pass it around, 80 bottles of beer on the wall.

80 bottles of beer on the wall, 80 bottles of beer.
Take one down and pass it around, 79 bottles of beer on the wall.

79 bottles of beer on the wall, 79 bottles of beer.
Take one down and pass it around, 78 bottles of beer on the wall.

78 bottles of beer on the wall, 78 bottles of beer.
Take one down and pass it around, 77 bottles of beer on the wall.

77 bottles of beer on the wall, 77 bottles of beer.
Take one down and pass it around, 76 bottles of beer on the wall.

76 bottles of beer on the wall, 76 bottles of beer.
Take one down and pass it around, 75 bottles of beer on the wall.

75 bottles of beer on the wall, 75 bottles of beer.
Take one down and pass it around, 74 bottles of beer on the wall.

74 bottles of beer on the wall, 74 bottles of beer.
Take one down and pass it around, 73 bottles of beer on the wall.

73 bottles of beer on the wall, 73 bottles of beer.
Take one down and pass it around, 72 bottles of beer on the wall.

72 bottles of beer on the wall, 72 bottles of beer.
Take one down and pass it around, 71 bottles of beer on the wall.

71 bottles of beer on the wall, 71 bottles of beer.
Take one down and pass it around, 70 bottles of beer on the wall.

70 bottles of beer on the wall, 70 bottles of beer.
Take one down and pass it around, 69 bottles of beer on the wall.

69 bottles of beer on the wall, 69 bottles of beer.
Take one down and pass it around, 68 bottles of beer on the wall.

68 bottles of beer on the wall, 68 bottles of beer.
Take one down and pass it around, 67 bottles of beer on the wall.

67 bottles of beer on the wall, 67 bottles of beer.
Take one down and pass it around, 66 bottles of beer on the wall.

66 bottles of beer on the wall, 66 bottles of beer.
Take one down and pass it around, 65 bottles of beer on the wall.

65 bottles of beer on the wall, 65 bottles of beer.
Take one down and pass it around, 64 bottles of beer on the wall.

64 bottles of beer on the wall, 64 bottles of beer.
Take one down and pass it around, 63 bottles of beer on the wall.

63 bottles of beer on the wall, 63 bottles of beer.
Take one down and pass it around, 62 bottles of beer on the wall.

62 bottles of beer on the wall, 62 bottles of beer.
Take one down and pass it around, 61 bottles of beer on the wall.

61 bottles of beer on the wall, 61 bottles of beer.
Take one down and pass it around, 60 bottles of beer on the wall.

60 bottles of beer on the wall, 60 bottles of beer.
Take one down and pass it around, 59 bottles of beer on the wall.

59 bottles of beer on the wall, 59 bottles of beer.
Take one down and pass it around, 58 bottles of beer on the wall.

58 bottles of beer on the wall, 58 bottles of beer.
Take one down and pass it around, 57 bottles of beer on the wall.

57 bottles of beer on the wall, 57 bottles of beer.
Take one down and pass it around, 56 bottles of beer on the wall.

56 bottles of beer on the wall, 56 bottles of beer.
Take one down and pass it around, 55 bottles of beer on the wall.

55 bottles of beer on the wall, 55 bottles of beer.
Take one down and pass it around, 54 bottles of beer on the wall.

54 bottles of beer on the wall, 54 bottles of beer.
Take one down and pass it around, 53 bottles of beer on the wall.

53 bottles of beer on the wall, 53 bottles of beer.
Take one down and pass it around, 52 bottles of beer on the wall.

52 bottles of beer on the wall, 52 bottles of beer.
Take one down and pass it around, 51 bottles of beer on the wall.

51 bottles of beer on the wall, 51 bottles of beer.
Take one down and pass it around, 50 bottles of beer on the wall.

50 bottles of beer on the wall, 50 bottles of beer.
Take one down and pass it around, 49 bottles of beer on the wall.

49 bottles of beer on the wall, 49 bottles of beer.
Take one down and pass it around, 48 bottles of beer on the wall.

48 bottles of beer on the wall, 48 bottles of beer.
Take one down and pass it around, 47 bottles of beer on the wall.

47 bottles of beer on the wall, 47 bottles of beer.
Take one down and pass it around, 46 bottles of beer on the wall.

46 bottles of beer on the wall, 46 bottles of beer.
Take one down and pass it around, 45 bottles of beer on the wall.

45 bottles of beer on the wall, 45 bottles of beer.
Take one down and pass it around, 44 bottles of beer on the wall.

44 bottles of beer on the wall, 44 bottles of beer.
Take one down and pass it around, 43 bottles of beer on the wall.

43 bottles of beer on the wall, 43 bottles of beer.
Take one down and pass it around, 42 bottles of beer on the wall.

42 bottles of beer on the wall, 42 bottles of beer.
Take one down and pass it around, 41 bottles of beer on the wall.

41 bottles of beer on the wall, 41 bottles of beer.
Take one down and pass it around, 40 bottles of beer on the wall.

40 bottles of beer on the wall, 40 bottles of beer.
Take one down and pass it around, 39 bottles of beer on the wall.

39 bottles of beer on the wall, 39 bottles of beer.
Take one down and pass it around, 38 bottles of beer on the wall.

38 bottles of beer on the wall, 38 bottles of beer.
Take one down and pass it around, 37 bottles of beer on the wall.

37 bottles of beer on the wall, 37 bottles of beer.
Take one down and pass it around, 36 bottles of beer on the wall.

36 bottles of beer on the wall, 36 bottles of beer.
Take one down and pass it around, 35 bottles of beer on the wall.

35 bottles of beer on the wall, 35 bottles of beer.
Take one down and pass it around, 34 bottles of beer on the wall.

34 bottles of beer on the wall, 34 bottles of beer.
Take one down and pass it around, 33 bottles of beer on the wall.

33 bottles of beer on the wall, 33 bottles of beer.
Take one down and pass it around, 32 bottles of beer on the wall.

32 bottles of beer on the wall, 32 bottles of beer.
Take one down and pass it around, 31 bottles of beer on the wall.

31 bottles of beer on the wall, 31 bottles of beer.
Take one down and pass it around, 30 bottles of beer on the wall.

30 bottles of beer on the wall, 30 bottles of beer.
Take one down and pass it around, 29 bottles of beer on the wall.

29 bottles of beer on the wall, 29 bottles of beer.
Take one down and pass it around, 28 bottles of beer on the wall.

28 bottles of beer on the wall, 28 bottles of beer.
Take one down and pass it around, 27 bottles of beer on the wall.

27 bottles of beer on the wall, 27 bottles of beer.
Take one down and pass it around, 26 bottles of beer on the wall.

26 bottles of beer on the wall, 26 bottles of beer.
Take one down and pass it around, 25 bottles of beer on the wall.

25 bottles of beer on the wall, 25 bottles of beer.
Take one down and pass it around, 24 bottles of beer on the wall.

24 bottles of beer on the wall, 24 bottles of beer.
Take one down and pass it around, 23 bottles of beer on the wall.

23 bottles of beer on the wall, 23 bottles of beer.
Take one down and pass it around, 22 bottles of beer on the wall.

22 bottles of beer on the wall, 22 bottles of beer.
Take one down and pass it around, 21 bottles of beer on the wall.

21 bottles of beer on the wall, 21 bottles of beer.
Take one down and pass it around, 20 bottles of beer on the wall.

20 bottles of beer on the wall, 20 bottles of beer.
Take one down and pass it around, 19 bottles of beer on the wall.

19 bottles of beer on the wall, 19 bottles of beer.
Take one down and pass it around, 18 bottles of beer on the wall.

18 bottles of beer on the wall, 18 bottles of beer.
Take one down and pass it around, 17 bottles of beer on the wall.

17 bottles of beer on the wall, 17 bottles of beer.
Take one down and pass it around, 16 bottles of beer on the wall.

16 bottles of beer on the wall, 16 bottles of beer.
Take one down and pass it around, 15 bottles of beer on the wall.

15 bottles of beer on the wall, 15 bottles of beer.
Take one down and pass it around, 14 bottles of beer on the wall.

14 bottles of beer on the wall, 14 bottles of beer.
Take one down and pass it around, 13 bottles of beer on the wall.

13 bottles of beer on the wall, 13 bottles of beer.
Take one down and pass it around, 12 bottles of beer on the wall.

12 bottles of beer on the wall, 12 bottles of beer.
Take one down and pass it around, 11 bottles of beer on the wall.

11 bottles of beer on the wall, 11 bottles of beer.
Take one down and pass it around, 10 bottles of beer on the wall.

10 bottles of beer on the wall, 10 bottles of beer.
Take one down and pass it around, 9 bottles of beer on the wall.

9 bottles of beer on the wall, 9 bottles of beer.
Take one down and pass it around, 8 bottles of beer on the wall.

8 bottles of beer on the wall, 8 bottles of beer.
Take one down and pass it around, 7 bottles of beer on the wall.

7 bottles of beer on the wall, 7 bottles of beer.
Take one down and pass it around, 6 bottles of beer on the wall.

6 bottles of beer on the wall, 6 bottles of beer.
Take one down and pass it around, 5 bottles of beer on the wall.

5 bottles of beer on the wall, 5 bottles of beer.
Take one down and pass it around, 4 bottles of beer on the wall.

4 bottles of beer on the wall, 4 bottles of beer.
Take one down and pass it around, 3 bottles of beer on the wall.

3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.

2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
    SONG
    assert_equal expected, BeerSong.lyrics
  end
end




#####

# class BeerSong 
#   def self.verse(line)
#     if line > 2 
#       "#{line} bottles of beer on the wall, #{line} bottles of beer.\n"\
#       "Take one down and pass it around, #{line - 1} bottles of beer on the wall.\n"
#     elsif line == 2 
#       "#{line} bottles of beer on the wall, #{line} bottles of beer.\n"\
#       "Take one down and pass it around, #{line - 1} bottle of beer on the wall.\n"
#     elsif line == 1 
#       "1 bottle of beer on the wall, 1 bottle of beer.\n" \
#       "Take it down and pass it around, no more bottles of beer on the wall.\n"
#     else 
#       "No more bottles of beer on the wall, no more bottles of beer.\n" \
#       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
#     end      
#   end

#   def self.verses(line1, line2)
#     all_lyrics = ''

#     line1.downto(line2).to_a.each do |line| 
#       if line > line2
#         all_lyrics << verse(line) + "\n"
#       else 
#         all_lyrics << verse(line)
#       end
#     end
    
#     all_lyrics
#   end

#   def self.lyrics
#     all_lyrics = ''

#     99.downto(0).to_a.each do |line| 
#       if line > 0
#         all_lyrics << verse(line) + "\n"
#       else 
#         all_lyrics << verse(line)
#       end
#     end
    
#     all_lyrics
#   end 
# end 
