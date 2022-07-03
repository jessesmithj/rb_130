# str = 'mississippi'
# print "matched 's'" if str.match(/s/)
# print "matched 'x'" if str.match(/x/)

# text = "\t tab test"
# puts "has tab" if text.match(/\t/)

# text = 'xyx'
# puts 'matched' if text.match(/[^x]/)

# text = 'xyx'
# puts 'matched' if text.match(/[^xyz]/)


# puts 'matched 1' if 'Four score'.match(/\s/) # => matches 
# puts 'matched 2' if "Four\tscore".match(/\s/) # => matches 
# puts 'matched 3' if "Four-score\n".match(/\s/) # => matches 
# puts 'matched 4' if "Four-score".match(/\s/) # => does not match 

# puts 'matched 1' if 'a b'.match(/\S/) # => matches
# puts 'matched 2' if " \t\n\r\f\v".match(/\S/) # => no matches (all whitespace characters)

# TEXT1 = "red fish\nblue fish"
# puts "matched red" if TEXT1.match(/^red/) # => matches
# puts "matched blue" if TEXT1.match(/^blue/) # => matches

# TEXT3 = "red fish\nblue fish"
# TEXT4 = "red fish\nred shirt"
# puts "matched red" if TEXT3.match(/\Ared/) # => matches
# puts "matched blue" if TEXT3.match(/\Ablue/) # => does not match 
# puts "matched fish" if TEXT4.match(/fish\z/) # => does not match 
# puts "matched shirt" if TEXT4.match(/shirt\z/) # => matches



###
###
###

# Exercises: 


# 1) Write a method that returns true if its argument looks like a URL, false if it does not.


# def url?(str)
#   return true if str.match(/\Ahttps?:\/\/.+.com\z/)
#   false
# end 

# def url?(str)
#   !!str.match(/\Ahttps?:\/\/\S+\z/)
# end 


# p url?('http://launchschool.com')   # -> true
# p url?('https://example.com')       # -> true
# p url?('https://example.com hello') # -> false
# p url?('   https://example.com')    # -> false


# 2) Write a method that returns all of the fields in a haphazardly formatted string. 
# A variety of spaces, tabs, and commas separate the fields, with possibly multiple occurrences of each delimiter.

# def fields(str)
#   str.split(/[" "\t,]+/)
# end

# p fields("Pete,201,Student") # -> ["Pete", "201", "Student"]
# p fields("Pete \t 201    ,  TA") # -> ["Pete", "201", "TA"]
# p fields("Pete \t 201") # -> ["Pete", "201"]
# p fields("Pete \n 201") # -> ["Pete", "\n", "201"]



# 3) Write a method that changes the first arithmetic operator (+, -, *, /) 
# in a string to a '?' and returns the resulting string. Don't modify the original string.

# def mystery_math(text)
#   text.sub(/[+\-*\/]/, '?')
# end


# p mystery_math('4 + 3 - 5 = 2')
# # -> '4 ? 3 - 5 = 2'

# p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # -> '(4 ? 3 + 2) / 7 - 1 = 1'


# 4) Write a method that changes every arithmetic operator (+, -, *, /)
#  to a '?' and returns the resulting string. Don't modify the original string.

#  def mysterious_math(text)
#   text.gsub(/[+\-*\/]/, '?')
# end

# p mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
# p mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'


# 5) Write a method that changes the first occurrence of the word apple, blueberry, or cherry in a string to danish.

# def danish(text) 
#   text.sub(/(\bapple|[a-z]+erry)\b/, 'danish')
# end

# def danish(text)
#   text.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
# end

# p danish('An apple a day keeps the doctor away') # -> 'An danish a day keeps the doctor away'
# p danish('My favorite is blueberry pie') # -> 'My favorite is danish pie'
# p danish('The cherry of my eye') # -> 'The danish of my eye'
# p danish('apple. cherry. blueberry.') # -> 'danish. cherry. blueberry.'
# p danish('I love pineapple') # -> 'I love pineapple'

# 6) Challenge: write a method that changes strings in the date format 2016-06-17 to the format 17.06.2016. 
# You must use a regular expression and should use methods described in this section.

# def format_date(original_date)
#   original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
# end

# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2016/06/17') # -> '2016/06/17' (no change)



# 7) Challenge: write a method that changes dates in the format 2016-06-17 or 2016/06/17 to the format 17.06.2016. 
# You must use a regular expression and should use methods described in this section.

# Capture Groups/Cleaner Solution

def format_date(original_date)
  original_date.sub(/\A(\d\d\d\d)-(\d\d)-(\d\d)\z/, '\3.\2.\1')
               .sub(/\A(\d\d\d\d)\/(\d\d)\/(\d\d)\z/, '\3.\2.\1')
end

# Capture Groups/More Complex Solution

def format_date(original_date)
  date_regex = /\A(\d\d\d\d)([\-\/])(\d\d)\2(\d\d)\z/
  original_date.sub(date_regex, '\4.\3.\1')
end

p format_date('2016-06-17') # -> '17.06.2016'
p format_date('2017/05/03') # -> '03.05.2017'
p format_date('2015/01-31') # -> '2015/01-31' (no change)