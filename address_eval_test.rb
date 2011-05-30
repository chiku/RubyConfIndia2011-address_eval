require 'test/unit'
require File.expand_path('address_eval')

class AddressTest < Test::Unit::TestCase
  def test_truey_on_bangalore
    assert Address.bangalore.truey?
  end

  def test_falsey_on_bangalore
    assert ! Address.bangalore.falsey?
  end

  def test_truey_on_delhi
    assert Address.delhi.truey?
  end

  def test_falsey_on_delhi
    assert ! Address.delhi.falsey?
  end
end
