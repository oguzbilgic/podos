require './card.rb'
require './deck.rb'

ALL_CARDS = []

Card::SUITS.each do |suit|
  Card::RANKS.each do |rank|
    ALL_CARDS << Card.new(rank, suit)
  end
end

class FullDeck < Deck
  def initialize
    super ALL_CARDS.clone

    self.shuffle!
  end
end
