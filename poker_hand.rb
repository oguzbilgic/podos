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
    return unless straight_flush?

    @cards.map(&:rank).max == 14
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    card_counts_by_rank.include? 4
  end

  def full_house?
    pair? && three_of_a_kind?
  end

  def flush?
    @cards.group_by(&:suit).count == 1
  end

  def straight?
    return if card_counts_by_rank != [1,1,1,1,1]

    card_ranks = @cards.map(&:rank)

    (card_ranks.max - card_ranks.min) == 4
  end

  def three_of_a_kind?
    card_counts_by_rank.include? 3
  end

  def two_pair?
    card_counts_by_rank == [2,2,1].sort!
  end

  def pair?
    card_counts_by_rank.include? 2
  end

  protected

  def card_counts_by_rank
    @card_counts_by_rank ||= @cards.group_by(&:rank).values.map(&:count).sort!
  end
end
