require 'test/unit'
require './poker_hand.rb'

class PokerHandTest < Test::Unit::TestCase
  def test_must_have_5_cards
    assert_raises { PokerHand.from_str '2♣' }
    assert_raises { PokerHand.from_str '2♦ 9♦ Q♣ K♣ 67♠' }
    assert_raises { PokerHand.from_str '2♦ 9♦ Q♣ K♣ 7♠ 7♠' }
  end

  def test_royal_flush
    assert_true PokerHand.from_str('K♣ A♣ Q♣ 10♣ J♣').royal_flush?
  end

  def test_straight_flush
    assert_true PokerHand.from_str('4♦ 6♦ 7♦ 5♦ 8♦').straight_flush?
  end

  def test_four_of_a_kind
    assert_true PokerHand.from_str('Q♥ 9♦ 9♥ 9♣ 9♠').four_of_a_kind?
    assert_true PokerHand.from_str('10♣ K♥ 10♥ 10♠ 10♦').four_of_a_kind?
    assert_true PokerHand.from_str('A♣ 7♣ A♦ A♠ A♥').four_of_a_kind?
    assert_true PokerHand.from_str('2♥ 2♠ 2♣ 2♦ 3♣').four_of_a_kind?
  end

  def test_full_house
    assert_true PokerHand.from_str('3♥ 3♠ 3♣ A♣ A♦').full_house?
    assert_true PokerHand.from_str('K♥ 4♣ 4♠ 4♦ K♣').full_house?
    assert_true PokerHand.from_str('Q♣ Q♠ K♦ Q♦ K♣').full_house?
    assert_true PokerHand.from_str('K♣ 8♥ K♦ K♥ 8♠').full_house?
    assert_true PokerHand.from_str('8♥ Q♦ 8♣ Q♠ Q♣').full_house?
    assert_true PokerHand.from_str('5♦ 9♠ 9♣ 9♥ 5♥').full_house?
    assert_true PokerHand.from_str('7♣ 3♣ 7♥ 3♠ 7♠').full_house?
  end

  def test_flush
    assert_true PokerHand.from_str('3♦ 8♦ K♦ A♦ 2♦').flush?
    assert_true PokerHand.from_str('K♣ A♣ Q♣ 10♣ 3♣').flush?
  end

  def test_straight
    assert_true PokerHand.from_str('5♣ 7♠ 9♣ 8♦ 6♣').straight?
    assert_true PokerHand.from_str('K♠ J♠ 10♠ Q♣ 9♣').straight?
    assert_true PokerHand.from_str('9♠ J♦ 8♦ 10♠ 7♦').straight?
    assert_true PokerHand.from_str('6♦ 7♣ 3♥ 5♣ 4♠').straight?
  end

  def test_straight_low_ace
    assert_true PokerHand.from_str('A♣ 2♠ 3♣ 4♦ 5♣').straight?
  end

  def test_three_of_a_kind
    assert_true PokerHand.from_str('2♦ J♦ A♣ 2♦ 2♣').three_of_a_kind?
    assert_false PokerHand.from_str('2♦ J♦ A♣ Q♦ 2♣').three_of_a_kind?
  end

  def test_two_pair
    assert_true PokerHand.from_str('2♦ J♦ J♣ Q♦ 2♣').two_pair?
  end

  def test_pair
    assert_true PokerHand.from_str('2♦ J♦ A♣ Q♦ 2♣').pair?
    assert_false PokerHand.from_str('2♦ J♦ A♣ Q♦ 3♣').pair?
  end
end
