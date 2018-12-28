require 'pry'
=begin
-Circular buffer AKA Ring buffer
-starting location doesn't matter (because its a circle!)
-When elements are "read", it's first in first out (oldest removed)
-When buffer is full, it throws an error to let client know that further writes
are blocked.
-Can force write by overwriting oldest data
-Circular buffer initializes with an integer argument for buffer size

Three Methods:
- #write
- #write! (overwrite)
- #read

Data Structure
-Array with index related to age
-front of array is newest. back of array is oldest.

Algo
- #write(num)
  - If there are empty spots in the array, insert at the front.
  - if array.any(&:nil?) unshift(num)
  - if array.any(&:nil?) throw FULL error

- #write!(num)
  - If array.none?(&:nil?) then #pop and unshift num
  - else unshift num
  
- #read
  - If array.all?(&nil?) then throw EMPTY error?
  - select highest index where element is not nil. an element whose next index is nil
  - then replace that index with 'nil'

=end
module CircularBufferException
  class BufferEmptyException < StandardError
    def initialize(msg = "The buffer is empty.")
      super
    end
  end
    
  class BufferFullException < StandardError
    def initialize(msg = "The buffer is full now!")
      super
    end
  end
end

class CircularBuffer
  attr_accessor :buffer
  attr_reader :max
  
  include CircularBufferException
  
  def initialize(max)
    @max = max
    @buffer = []
  end
  
  def write(num)
    unless num.nil?
      raise BufferFullException if full?
      buffer << num unless full?
    end
  end
  
  def read
    raise BufferEmptyException if buffer.empty?
    buffer.shift unless buffer.empty?
  end
  
  def write!(num)
    if full? && !num.nil?
      buffer.shift
      buffer << num
    else
      write(num)
    end
  end
  
  def clear
    buffer.clear
  end
  
  def full?
    self.buffer.size >= max
  end
end

binding.pry

puts "hi"