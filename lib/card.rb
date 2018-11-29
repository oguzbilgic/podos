class Card
  attr_accessor :rank, :suit

  RANKS = (2..14)
  SUITS = [:club, :diamond, :heart, :spade]
  SUIT_SYMBOLS = { club: '♣', heart: '♥', spade: '♠', diamond: '♦' }

  def initialize rank, suit
    raise 'rank is not valid' unless RANKS.include? rank
    raise 'suit is not valid' unless SUITS.include? suit

    @rank = rank
    @suit = suit
  end

  def self.from_str str
    rank = str.to_i
    rank = 14 if str.include? 'A'
    rank = 13 if str.include? 'K'
    rank = 12 if str.include? 'Q'
    rank = 11 if str.include? 'J'

    suit = :club if str.include? '♣'
    suit = :heart if str.include? '♥'
    suit = :spade if str.include? '♠'
    suit = :diamond if str.include? '♦'

    Card.new rank, suit
  end

  def rank_to_s
    return "J" if @rank == 11
    return "Q" if @rank == 12
    return "K" if @rank == 13
    return "A" if @rank == 14
    @rank
  end

  def to_s
    "#{rank_to_s}#{@SUIT_SYMBOLS[@suit]}"
  end

  # def == other_card
  #   other_card.rank == @rank && other_card.suit == @suit
  # end
end
