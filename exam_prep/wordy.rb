=begin
WordProblem class initializes with a string argument (a math word problem
in the form 'What is #{num} #{operator} #{num}?')

One method, #answer
returns the answer to the problem
Throws an Argument error if string in the wrong form

Algorithm (#answer)
-check form
-raise error if wrong format
-convert if correct format
  - sub(/What is /, '')
  - take the first digit, store it as `response`
  - 
-return answer
=end
require 'pry'
class WordProblem
  OPERATORS = {"minus" => :-, "plus" => :+, "multiplied" => :*,
               "divided" => :/}
  
  attr_accessor :question
  
  def initialize(question)
    @question = question
  end
  
  def answer
    problem = format_question
    result = problem.first.to_i
    problem.shift
    problem.each_with_index do |word, idx|
      if word.to_i.to_s == word
        result = result.send(OPERATORS[problem[idx - 1]],word.to_i)
      end
    end
    result
  end
  
  private
  
  def format_question
    format = /\-?\d+(\s(divided|multiplied|minus|plus)\s\-?\d+)+/
    format_question = question.sub(/What is /, '').sub(/\?/, '').gsub(/by /,'')
    unless format_question.match(format)
      raise ArgumentError
    end
    format_question = format_question.split(" ")
  end
end

binding.pry

puts "hi"