=begin
Creating a class Meetup that takes two arguments upon initialization
- a month
- a year

Has a Class Method #day that takes two arguments:
- a day
- a "schedule" (i.e. teenth, first, second, third, fourth, or last)
And returns a date object that corresponds to the meetup day on the given month
and.

Algorithm
- In the given month or year, list out all of the date objects (in an array) 
that correspond with the day passed to the #day method.
- If schedule == :teenth
    return the day where (13..19).include? day(date)
- Case schedule
  when :first then days[0]
  when :second then days[1]
  when :third then days[2]
  when :fourth then days[3]
  when :last then days.last
=end

require 'date'
require 'pry'

class Meetup
  DAYS_OF_WEEK = {sunday: 0, monday: 1, tuesday: 2, wednesday: 3,
                  thursday: 4, friday: 5, saturday: 6}
                  
  attr_accessor :calendar
  
  def initialize(month, year)
    @calendar = get_calendar(Date.new(year, month))
  end
  
  def day(day, schedule)
    days = calendar.select { |date| date.wday == DAYS_OF_WEEK[day] }.sort
    case schedule
    when :first then days[0]
    when :second then days[1]
    when :third then days[2]
    when :fourth then days[3]
    when :last then days.last
    when :teenth then days.select { |date| (13..19).include? date.mday }.first
    end
  end
  
  private
  
  
  def get_calendar(date)
    end_date = date.next_month
    calendar = []
    until date == end_date
      calendar << date
      date = date.next_day
    end
    calendar
  end
end

binding.pry

puts "hi"