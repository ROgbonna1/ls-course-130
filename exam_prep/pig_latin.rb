=begin
- Rule 1: If a word begins with a vowel sound, add an "ay" sound to the end of 
          the word.
- Rule 2: If a word begins with a consonant sound, move it to the end of the 
          word, and then add an "ay" sound to the end of the word.
- Edge Cases
    - 'ch' counts as one consonant in the front of a word
    - 'qu'
    - 'squ'
    - 'th'
    - 'thr'
    - 'xy', 'xa', 'xe', 'xi', 'xo', 'xu' all treated as consonants
    - 'xr' in the front should be treated as a vowel start
    
- Phrases should be translated one word at a time.

Algorithm
- Split into array of words
- for each word, run #translate method
  - #transate
    - check start of word
    - if CONSONANTS.include?(start of word), then start of word moves to end
    - append 'ay' to end of word
- join array
=end

class PigLatin
  def self.translate(words)
    words = words.split
    words.map! do |word|
      self.translate_word(word)
    end.join(" ")
  end
  
  def self.translate_word(word)
    case word[0]
    when "x" then self.translate_word_x(word)
    when "y" then self.translate_word_y(word)
    when /[aeiou]/ then word << "ay"
    else
      self.translate_word_cons(word)
    end
  end
  
  def self.translate_word_x(word)
    word.sub!('x','').<< 'x'if word.match(/\Ax[aeiou]/)
    word << 'ay'
  end
  
  def self.translate_word_cons(word)
    consonants = /\A(ch|qu|squ|sch|thr|th|[^aeiouy])/
    start_of_word = word.match(consonants).to_s
    word.sub!(start_of_word,'').<< start_of_word
    word << 'ay'
  end
  
  def self.translate_word_y(word)
   word.sub!('y','').<< 'y'if word.match(/\Ay[aeiou]/)
   word << 'ay'
  end
end