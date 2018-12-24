require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @file = File.open('sample_text.txt')
    @text = Text.new(@file.read)
  end
  
  def teardown
    @file.close
  end
  
  def test_swap
    assert_equal('LXrem ipsum dXlXr sit amet, cXnsectetur adipiscing elit.',
      @text.swap('o','X'))
  end
  
  def test_word_count
    assert_equal(8, @text.word_count)
  end
end