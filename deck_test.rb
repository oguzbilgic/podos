require 'test/unit'
require './deck.rb'

class DeckTest < Test::Unit::TestCase
  def test_from_str
    str = '2♦ J♦ A♣ Q♦'
    deck = Deck.from_str str

    assert_equal 4, deck.count
    assert_equal str, deck.to_s
  end

  def test_from_str_fail
  end
end
