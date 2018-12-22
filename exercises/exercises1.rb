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
binding.pry
puts "hi"