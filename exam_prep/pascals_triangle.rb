=begin
Algorithm
for arrs i and j, where i is the previous array
j = Array.new(nil)
j.each_with_index do |el, idx|
  if idx == 0
    j[idx] = 1
  elsif i[idx]
    j[idx] = i[idx] + i[idx - 1]
  else
    j[idx] = 1
  
end
=end
require 'pry'
class Triangle
  attr_reader :rows
  
  def initialize(rows)
    @rows = set_rows(rows)
  end
  
  private 
  
  def set_rows(rows)
    triangle_rows = Array.new(rows) {Array.new}
    triangle_rows.each_with_index do |row, row_number|
      (row_number + 1).times do |num|
        if num == 0
          row << 1
        elsif triangle_rows[row_number - 1][num]
          row << (triangle_rows[row_number - 1][num] + triangle_rows[row_number - 1][num - 1])
        else
          row << 1
        end
      end
    end
    triangle_rows
  end
  
end

binding.pry
puts "hi"