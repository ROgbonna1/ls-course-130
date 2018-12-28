=begin
1 = wink #=> 1
10 = double blink # => 2
100 = close your eyes # => 4
1000 = jump # => 8

10000 = Reverse the order of the operations in the secret handshake. # => 16

SecretHandshake.new(19) # => ['double blink', 'wink']
16 + 2 + 1 => 1 + 2 + 16 => 'wink', 'double blink', 'reverse'
  => 'reverse', 'double blink', 'wink' => #shift => 'double blink', 'wink'

SecretHandshake.new(31) # => ['jump', 'close your eyes', 'double blink', 'wink']
16 + 8 + 4 + 2 + 1 => 1 + 2 + 4 + 8 + 16 => 'wink', 'double blink',
  'close your eyes', 'jump', 'reverse' => 'reverse', 'jump', 'close your eyes',
  'double blink', 'wink' => #shift => 'jump', 'close your eyes', 'double blink',
  'wink'
  
SecretHandshake.new "11001" # => ["jump","wink"]
16 + 8 + 1 => 1 + 8 + 16 => 'wink', 'jump', 'reverse' => 'reverse', 'jump',
  'wink' => #shift => 'jump', 'wink'
  
Algo:
-convert to binary if base_ten?
-split digits
-reverse array (so that moves start with 2 and move up to 16)
-map with index to return new array with 'moves' in place of '1's
-delete 'nil's
-array.reverse!.shift if array.last == 'reverse'

=end

class SecretHandshake
  COMMANDS = { 0 => "wink", 1 => "double blink", 2 => "close your eyes",
            3 => "jump", 4 => "reverse" }
            
  def initialize(num)
    @num = num
    to_bin_str
  end
  
  def commands
    commands = @num.split('').reverse
    commands.map!.with_index { |num, idx| COMMANDS[idx] if num == "1" }.delete(nil)
    commands.reverse!.shift if commands.last == "reverse"
    commands
  end
  
  private
  
  def to_bin_str
    if @num.class == Integer
      @num = @num.to_s(2)
    end
  end

end

