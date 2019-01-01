=begin
Palindrome instances initialize with a hash as an argument
def initialize(factors = {max_factor: 1, min_factor: 1})
end

instance methods:
generate -> creates an array of palindromes given min and max factors
largest -> returns largest palindrome (on generated list), 
can be in string form
value -> returns integer value of palindrome
factors -> returns nested array of factors of palindrome
=end
require 'pry'
class Palindromes
  attr_reader :max_factor, :min_factor
  attr_accessor :palindromes

  def initialize(factors = {})
    @max_factor = factors[:max_factor]
    @min_factor = factors[:min_factor] || 1
    @palindromes = []
  end
  
  def generate
    factors = (min_factor..max_factor).to_a
                .repeated_combination(2).to_a 
                .select { |arg1, arg2| is_palindrome?(arg1 * arg2) }
    factors.each do |arg1, arg2|
      if is_palindrome?(arg1 * arg2)
        palindromes << Palindrome.new(arg1 * arg2, max_factor, min_factor)
      end
    end
    palindromes.uniq!
  end
  
  def largest
    palindromes.max
  end
  
  def smallest
    palindromes.min
  end
  
  private
  
  def is_palindrome?(num)
    num.to_s.reverse.to_i == num
  end
end

class Palindrome
  include Comparable
  
  attr_reader :value, :min_factor, :max_factor
  
  def initialize(num, max_factor, min_factor)
    @value = num
    @max_factor = max_factor
    @min_factor = min_factor
  end
  
  def factors
    (min_factor..max_factor).to_a
      .repeated_combination(2).to_a
      .select { |arg1, arg2| arg1 * arg2 == value }
  end
  
  def <=>(other)
    value <=> other.value
  end
end

binding.pry

puts "hi"