=begin
- School roster stored in a hash
  - Grade is key. Array of students as values.
  
- Methods
  - #to_h
    - returns school roster hash
  - #grade(num)
    - returns an array of students that corresponds to grade (key = num)
  - #add(name, grade)
    - adds name to value array for associated grade key
    - if grade key not present, creates grade.
=end

class School
  attr_accessor :roster
  
  def initialize
    @roster = Hash.new([])
  end
  
  def grade(num)
    roster[num]
  end
  
  def add(name, grade)
    roster.has_key?(grade) ? roster[grade] << name : roster[grade] = [name]
  end
  
  def to_h
    roster.each { |grade, names| names.sort! }
    roster.sort.to_h
  end
end