require 'forwardable'

class Deck
  extend Forwardable

  def_delegators :@cards, :count, :<<, :map, :shuffle!

  attr_accessor :cards

  def initialize cards = []
    # Todo raise if duplicate

    @cards = cards
  end

  def self.from_str str
    self.new str.split(' ').map { |str| Card.from_str str }
  end

  def deal number
    @cards.shift number
  end

  # def remove_card(card)
  #   cards = @cards.select { |c| c != card }
  # end

  def to_s
    @cards.map(&:to_s).join ' '
  end

  def + other_deck
    self.new @cards + other_deck.cards
  end

  def - other_deck
    self.new @cards.select { |c| !other_deck.cards.include? c }
  end
end
