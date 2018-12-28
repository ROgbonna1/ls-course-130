=begin
-Has class method #create to create valid Luhn number based on arg passed in
-Luhn addends algorithm
  -Split digits to array
  -Reverse array
  -#double_digit method on all odd indices
  -#reverse! array back to original order
  
-Luhn checksum
  -sum #addends
  
-Luhn Validation
  -if #checksum % 10 == 0, number is valid
  
-Luhn Create
  -append a zero (to ensure the digit length matches) and validate the #checksum
  -unless already valid? replace last digit of addends with a number that will
   make the sum a multiple of 10
    -num.to_s << 10 - #checksum % 10.to_s
=end

class Luhn
  attr_accessor :num
  
  def initialize(num)
    @num = num
  end
  
  def addends
    addends = num.digits
    addends.map!.with_index { |dig, idx| idx.odd? ? double_digit(dig) : dig }
    addends.reverse
  end
  
  def checksum
    addends.sum
  end
  
  def valid?
    checksum % 10 == 0
  end
  
  def self.create(luhn)
    luhn = Luhn.new(luhn * 10)
    if luhn.valid?
      luhn.num
    else
      until luhn.valid?
        luhn.num += 1
      end
      luhn.num
      # num_str = luhn.num.to_s
      # num_str[-1] = (10 - (luhn.checksum % 10)).to_s
      # num_str.to_i
    end
  end
  
  def to_s
    @num.to_s
  end
  
  private
  
  def double_digit(dig)
    dig = dig * 2 
    dig > 9 ? dig - 9 : dig
  end
  
end