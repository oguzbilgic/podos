require 'forwardable'

require './card.rb'

class Deck
  extend Forwardable

  def_delegators :@cards, :count, :<<, :map, :shuffle!

  attr_accessor :cards

  def initialize cards = []
    @cards = cards
  end

  def deal number
    number.times.map { @cards.shift }
  end
  
  # def remove_card(card)
  #   @cards = @cards.select { |c| c != card }
  # end

  def to_s
    @cards.map &:to_s
  end

  def + other_deck
    Deck.new @cards + other_deck.cards
  end

  def - other_deck
    Deck.new @cards.select { |c| !other_deck.cards.include? c }
  end
end
