require './card.rb'
require './deck.rb'

class PokerHand < Deck
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
  end

  def pair?
    grouped_cards = @cards.group_by &:rank
    grouped_cards.values.map(&:count).include? 2
  end

  def check
    raise 'doesnt have 5 cards' if self.count != 5
  end
end
