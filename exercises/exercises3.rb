require 'pry'

class TextAnalyzer
  def process
    file = File.open('test_file.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "Nice selection of food we have gathered!"
end

gather(items) do |group|
  group.each_with_index do |item, idx|
    puts "##{idx + 1}. #{item}"
  end
end

def group_items(arr)
  yield(arr)
end

group_items(["this", "is", "a", "test"]) do |_, _, *items|
  items.each_with_index do |item, index|
    puts item
    puts index
  end
end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |first , *last_three|
  puts last_three.join(", ")
  puts first
end

gather(items) do |first , *middle_two ,last |
  puts first
  puts middle_two.join(", ")
  puts last
end

gather(items) do |first , *last_three |
  puts first
  puts last_three.join(", ")
end

gather(items) do |first, second, third, last |
  puts "#{first}, #{second}, #{third}, and #{last}"
end

def convert_to_base_8(n)
  result = n
  base_8 = []
  until result == 0
    base_8.unshift(result % 8)
    result = result / 8
  end
  base_8.join.to_i
end

# The correct type of argument must be used below
base8 = method(:convert_to_base_8)

# We'll need a Proc object to make this code work. Replace `a_proc`
# with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8)

def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1], array[index])
      else
        next if array[index - 1] <= array[index] unless block_given?
      end
      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
  nil
end

binding.pry

puts "hi"