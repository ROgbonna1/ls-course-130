=begin
Goal is to clean up phone numbers
Two Methods:
- #number
  - returns a 10-digit string. No dashes. No periods.
  - returns "0000000000" if number does not consist of 10 digits
  - If  number is 11 digits and  first number is 1, use the last 10 digit
  - If number is 11 digits and number[0] != 1, return "0000000000"
  - If number.length > 11 and number.length < 10, return "000000000"
  Algorithm:
   - Delete all non-digits. gsub(/[^\d]/,'')
   - return "00000000000" unless [10,11].include? num.length
   - num.shift if num.length == 11 && num[0] == "1"
  
- to_s
  - returns in the form '(123) 456-7890'
  Algorithm
  - string interpoation: "#{first_part} #{second_part}-#{last_part}"
=end

class PhoneNumber
  INVALID = "0000000000"
  
  attr_accessor :phone

  def initialize(number)
    @phone = number.gsub(/[^a-z0-9]/i,'')
  end
  
  def number
    return INVALID if phone =~ /[a-z]/i
    if phone.length == 11
      return INVALID if phone[0] != "1"
      phone[1..-1]
    elsif phone.length == 10
      phone
    else
      INVALID
    end
  end
  
  def area_code
    number[0..2]
  end
  
  def to_s
    _, first_part, second_part, last_part = 
      number.match(/(...)(...)(....)/).to_a
    "(#{first_part}) #{second_part}-#{last_part}"
  end
end

# num_str.gsub(/[^\d]/,'')