require 'test/unit'
require './card.rb'

class CardTest < Test::Unit::TestCase
  def test_from_str
    assert_equal :diamond, Card.from_str('2♦').suit
    assert_equal 2, Card.from_str('2♦').rank

    assert_equal :club, Card.from_str('A♣').suit
    assert_equal 14, Card.from_str('A♣').rank

    assert_equal :heart, Card.from_str('K♥').suit
    assert_equal 13, Card.from_str('K♥').rank

    assert_equal :diamond, Card.from_str('Q♦').suit
    assert_equal 12, Card.from_str('Q♦').rank

    assert_equal :diamond, Card.from_str('J♦').suit
    assert_equal 11, Card.from_str('J♦').rank
  end

  def test_from_str_fail
    assert_raises { Card.from_str('sdf') }
    assert_raises { Card.from_str('22♦') }
    assert_raises { Card.from_str('22') }
  end
end
