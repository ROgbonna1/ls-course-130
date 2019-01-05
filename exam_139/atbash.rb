=begin
The atbash cipher The cipher is a simple substitution cipher that replaces the
first letter of the alphabet with the last, the second letter with the next to
last, etc.

-only one method: #encode
Algo:
- store letters in two arrays
- for each letter in a word
  - if array1.include? letter
      replace with same index from array2
  - else
      find index it occupies in array2 and replace with letter
      in same location in array1
=end

class Atbash
  CIPHER = {
    first: %w(a b c d e f g h i j k l m),
    second: %w(z y x w v u t s r q p o n)
  }

  def self.encode(string)
    prepare_for_encoding(string).split(//).map do |letter|
      encrypt(letter)
    end.join.gsub(/(.{5})/, '\1 ').sub(/\s$/, '')
  end

  def self.prepare_for_encoding(string)
    string.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def self.encrypt(letter)
    if letter.to_i.to_s == letter
      letter
    elsif CIPHER[:first].include? letter.downcase
      CIPHER[:second][CIPHER[:first].index(letter)]
    else
      CIPHER[:first][CIPHER[:second].index(letter)]
    end
  end
end
