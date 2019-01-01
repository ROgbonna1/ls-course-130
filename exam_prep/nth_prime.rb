=begin
class or module method nth
takes an integer argument. returns that nth prime number
raises an ArgumentError if argument <=0

algorithm:
build an array of primes until array.length == num, then return array.last
-or-
count = 0
candidate = 2

loop do
  count += 1 if is_prime?(candidate)
  candidate += 1
  break if count == num
end


is_prime?(num)
stop = sqrt(num)
1.upto(stop) do |i|
  return true if num % i == 0
end
false
end
=end
require 'benchmark'
class Prime
  def self.nth(num)
    raise ArgumentError if num <= 0
    count = 1
    candidate = 3
    loop do
      count += 1 if is_prime?(candidate)
      break if count == num
      candidate += 2
    end
    candidate
  end
  
  private 
  
  def self.is_prime?(num)
    stop = Math.sqrt(num)
    2.upto(stop) do |i|
      return false if num % i == 0
    end
    true
  end
end

class OtherPrime
  def self.nth(n)
    fail ArgumentError if n < 1
    primes = [2]
    current_test = 3
    until primes.size == n
      primes << current_test if prime?(current_test)
      current_test += 2
    end
    primes.last
  end

  def self.prime?(number)
    (2..Math.sqrt(number)).each do |test|
      return false if number % test == 0
    end
    true
  end
end

Benchmark.bm do |x|
  x.report("Reuben's Method") { Prime.nth 10_000 }
  x.report("Other Method") {OtherPrime.nth 10_000 }
end