require 'test/unit'
require './poker_hand.rb'

class PokerHandTest < Test::Unit::TestCase
  def test_must_have_5_cards
    assert_raises { PokerHand.from_str '2♣' }
    assert_raises { PokerHand.from_str '2♦ 9♦ Q♣ K♣ 67♠' }
    assert_raises { PokerHand.from_str '2♦ 9♦ Q♣ K♣ 7♠ 7♠' }
  end

  def test_pair
    pair = '2♦ J♦ A♣ Q♦ 2♣'
    not_pair = '2♦ J♦ A♣ Q♦ 3♣'

    assert_true PokerHand.from_str(pair).pair?
    assert_false PokerHand.from_str(not_pair).pair?
  end

  def test_three_of_a_kind
    three_of_a_kind = '2♦ J♦ A♣ 2♦ 2♣'
    not_three_of_a_kind = '2♦ J♦ A♣ Q♦ 2♣'

    assert_true PokerHand.from_str(three_of_a_kind).three_of_a_kind?
    assert_false PokerHand.from_str(not_three_of_a_kind).three_of_a_kind?
  end
end
