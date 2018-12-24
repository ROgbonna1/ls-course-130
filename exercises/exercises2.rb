require 'minitest/autorun'

class PracticeTests < Minitest::Test
  
  def test_odd
    value = 3
    assert(value.odd?, "value is not odd")
  end
  
  def test_downcase
    value = 'Xyz'
    assert_equal('xyz', value.downcase)
  end
  
  def test_nil
    value = nil
    assert_nil(value)
  end
  
  def test_empty
    list = []
    assert(list.empty?, "List isn't empty")
  end
  
  def test_inclusion
    item = 'xyz'
    list = ['abc', 'xyz']
    assert_includes(list, item)
  end
  
  def test_experience
    assert_raises(NoExperienceError) {employee.hire}
  end
  
  def test_numeric
    assert_instance_of(Numeric, value)
  end
  
  def test_numeric_subclass
    assert_kind_of(Numeric, value)
  end
  
  def test_same
    assert_same(list, list.process)
  end
  
  def test_inclusion
    refute_includes(list, 'xyz')
  end
end