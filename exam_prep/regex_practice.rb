def url?(str)
  puts !!str.match(/(^https?:\/\/)(\S+\z)/)
end

url?('http://launchschool.com')   # -> true
url?('https://example.com')       # -> true
url?('https://example.com hello') # -> false
url?('   https://example.com')    # -> false

def fields(str)
  p str.split(/[\s+,]+/)
end

fields("Pete,201,Student")
# -> ['Pete', '201', 'Student']

fields("Pete \t 201    ,  TA")
# -> ['Pete', '201', 'TA']

fields("Pete \t 201")
# -> ['Pete', '201']

def mystery_math(math_str)
  p math_str.sub(/[\+\-\*\/]/, "?")
end

mystery_math('4 + 3 - 5 = 2')
# -> '4 ? 3 - 5 = 2'

mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# -> '(4 ? 3 + 2) / 7 - 1 = 1'

def mysterious_math(math_str)
  p math_str.gsub(/[\+\-\*\/]/, "?")
end

mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

def danish(str)
  p str.sub(/\b(apple|blueberry|cherry)\b/, "danish")
end

danish('An apple a day keeps the doctor away')
# -> 'An danish a day keeps the doctor away'

danish('My favorite is blueberry pie')
# -> 'My favorite is danish pie'

danish('The cherry of my eye')
# -> 'The danish of my eye'

danish('apple. cherry. blueberry.')
# -> 'danish. cherry. blueberry.'

danish('I love pineapple')
# -> 'I love pineapple'

def format_date(date)
  # if capture = date.match(/(\d{4})([\-\/])(\d{2})\2(\d{2})/)
  #   p "#{capture[4]}.#{capture[3]}.#{capture[1]}"
  # else
  #   p date
  # end
  
  p date.sub(/(\d{4})\-(\d{2})\-(\d{2})/, '\3.\2.\1')
        .sub(/(\d{4})\/(\d{2})\/(\d{2})/, '\3.\2.\1')
end

format_date('2016-06-17') # -> '17.06.2016'
format_date('2017/05/03') # -> '03.05.2017'
format_date('2015/01-31') # -> '2015/01-31' (no change)