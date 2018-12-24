require 'pry'
class Tree
  include Enumerable
  
  def each
  end
end

def compute(word)
  block_given? ? yield(word) : "Does not compute."
end

def missing(nums_array)
  missing_nums = []
  nums_array.first.upto(nums_array.last) do |num|
    missing_nums << num unless nums_array.include? num
  end
  missing_nums
end

def divisors(num)
  divisors = []
  1.upto(num) do |divisor|
    divisors << divisor if num % divisor == 0
  end
  divisors
end

ENCRYPTED_NAMES = [
    "Nqn Ybirynpr",
    "Tenpr Ubccre",
    "Nqryr Tbyqfgvar",
    "Nyna Ghevat",
    "Puneyrf Onoontr",
    "Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv",
    "Wbua Ngnanfbss",
    "Ybvf Unvog",
    "Pynhqr Funaaba",
    "Fgrir Wbof",
    "Ovyy Tngrf",
    "Gvz Orearef-Yrr",
    "Fgrir Jbmavnx",
    "Xbaenq Mhfr",
    "Fve Nagbal Ubner",
    "Zneiva Zvafxl",
    "Lhxvuveb Zngfhzbgb",
    "Unllvz Fybavzfxv",
    "Tregehqr Oynapu",
]


def decrypt(string)
  new_str = ''
  string.chars.each do |letter|
    case letter
    when /[a-mA-M]/ then new_str << (letter.ord + 13).chr
    when /[n-zN-Z]/ then new_str << (letter.ord - 13).chr
    when /[^a-zA-Z]/ then new_str << letter
    end
  end
  new_str
end

def any?(arr)
  arr.each do |element|
    return true if yield(element)
  end
  false
end

def all?(arr)
  arr.each do |element|
    return false unless yield(element)
  end
  true
end

def none?(arr)
  arr.each { |element| return false if yield(element) }
  true
end

def one?(arr)
  true_count = 0
  arr.each do |element|
    true_count += 1 if yield(element)
    return false if true_count > 1
  end
  true_count == 1
end

def count(arr)
  count = 0
  arr.each { |element| count += 1 if yield(element) }
  count
end

def step(num, fin, step)
  loop do
    yield(num)
    num += step
    break if num > fin
  end
end

def zip(arr1, arr2)
  arr = []
  arr1.each_with_index do |num, idx|
    arr << [num, arr2[idx]]
  end
  arr
end

def map(arr)
  arr.each_with_object([]) do |item, obj|
    obj << yield(item)
  end
end

def count(*nums)
  total = 0
  nums.each { |item, obj| total +=1 if yield(item) }
  total
end

def drop_while(arr)
  placeholder = arr.clone
  arr.each do |element|
    placeholder.shift if yield(element)
    break unless yield(element)
  end
  placeholder
end

def each_with_index(arr)
  index = 0
  arr.each do |i|
    yield(i,index)
    index += 1
  end
end

def each_with_object(arr, obj)
  arr.each { |item| yield(item, obj) }
  obj
end

def max_by(arr)
  largest = arr[0]
  arr.each do |element|
    largest = element if yield(element) > yield(largest)
  end
  largest
end

def each_cons(arr, args)
  index = 0
  until index > arr.length - args
    yield(arr[index], *arr[(index + 1)...(index + args)])
    index += 1
  end
  nil
end

binding.pry
puts "hi"