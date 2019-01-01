=begin
Clock class (or module)
three methods
- #at(takes one or two integer arguments... second default to 0)
  - first arg is stored as hour
  - second is minutes

- #+ takes one integer argument.
  - adds integers to minutes.

- #to_s displays clock in 24 hour time

Algorithm
- two instance variables. @minutes @hours
- initialize with @minutes = 0 and @hours = 0
- #at(hour, minutes)
  - @hour += hour
  - @minute += minute
  - if @minute >= 60 then 
      @hour += 1
      @minute -= 60
  - if @hour >= 24
      @hour -= 24


=end
require 'pry'

class Clock
  attr_accessor :hours, :minutes
  
  def initialize(hours, minutes)
    @hours = hours
    @minutes = minutes
    balance
  end
  
  def self.at(hours, minutes = 0)
    Clock.new(hours, minutes)
  end
  
  def +(minutes)
    @minutes += minutes
    balance
    self
  end
  
  def -(minutes)
    @minutes -= minutes
    balance
    self
  end
  
  def to_s
    hours = format("%02d", @hours)
    minutes = format("%02d", @minutes)
    "#{hours}:#{minutes}"
  end
  
  def ==(other)
    minutes == other.minutes && hours == other.hours
  end
  
  private
  
  def balance
    if @minutes >= 60 || @minutes < 0
      @hours += @minutes/60
      @minutes = @minutes % 60
    end
    if @hours >= 24 || @hours < 0
      @hours = @hours % 24
    end

  end
end

binding.pry

puts "hi"