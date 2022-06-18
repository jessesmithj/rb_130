# Read the text file in the #process method and pass the text to the block provided in each call. 
# Everything you need to work on is either part of the #process method or part of the blocks. 
# You need no other additions or changes.

# The text you use does not have to produce the same numbers as the sample output 
# but should have the indicated format.


class TextAnalyzer
  def process
    file = File.open("sample.txt", 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |file| puts "#{file.split(/\n\n/).count} paragraphs"  }
analyzer.process { |file| puts "#{file.split("\n").count} lines" }
analyzer.process { |file| puts "#{file.split(" ").count} words" }



# Sample Output 

# 3 paragraphs
# 15 lines
# 126 words
