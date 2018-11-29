require './card.rb'
require './deck.rb'

class FullDeck < Deck
  def initialize
    super

    Card::SUITS.each do |suit|
      Card::RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end

    self.shuffle!
  end
end
