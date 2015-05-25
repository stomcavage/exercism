class Hash
  def add_char_keys(str, value)
    str.each_char { |key| self[key]= value }
  end
end

class Scrabble
  attr_reader :score

  def self.score(word)
    Scrabble.new(word).score
  end

  def initialize(word)
    if /\w+/.match(word)
      letters = {}

      letters.add_char_keys("AEIOULNRST", 1)
      letters.add_char_keys("DG", 2)
      letters.add_char_keys("BCMP", 3)
      letters.add_char_keys("FHVWY", 4)
      letters.add_char_keys("K", 5)
      letters.add_char_keys("JX", 8)
      letters.add_char_keys("QZ", 10)

      @score = word.chars.inject(0) do |sum, c|
        sum + letters[c.upcase]
      end
    else
      @score = 0
    end
  end
end
