require './card.rb'
require './deck.rb'

class PokerHand < Deck
  def initialize cards
    raise 'doesnt have 5 cards' if cards.count != 5

    super cards
  end

  def rank
    return :royal_flush if royal_flush?
    return :straight_flush if straight_flush?
    return :four_of_a_kind if four_of_a_kind?
    return :full_house if full_house?
    return :flush if flush?
    return :straight if straight?
    return :two_pair if two_pair?
    return :pair if pair?
    :high_card
  end

  def royal_flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    grouped_cards = @cards.group_by &:rank
    grouped_cards.values.map(&:count).include? 4
  end

  def full_house?
    pair? && three_of_a_kind?
  end

  def flush?
    grouped_cards = @cards.group_by &:suit
    grouped_cards.count == 1
  end

  def straight?
  end

  def three_of_a_kind?
    grouped_cards = @cards.group_by &:rank
    grouped_cards.values.map(&:count).include? 3
  end

  def two_pair?
    grouped_cards = @cards.group_by(&:rank).values.map(&:count)
    grouped_cards.sort! == [2,2,1].sort!
  end

  def pair?
    grouped_cards = @cards.group_by &:rank
    grouped_cards.values.map(&:count).include? 2
  end
end
