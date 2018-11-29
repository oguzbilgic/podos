require 'benchmark'
require './card.rb'
require './deck.rb'
require './full_deck.rb'
require './poker_hand.rb'

# def pair_odd player_cards, community_cards
#   visible_cards = player_cards + community_cards
#   remaining_cards = FullDeck.new - visible_cards
#
#   puts visible_cards.count
#   puts remaining_cards.count
#
#   uniq_count = visible_cards.map(&:rank).uniq.count
#   if uniq_count < visible_cards.count
#     1
#   else
#     uniq_count * 4 % remaining_cards.count
#   end
# end
#
# player_cards = Deck.new
# player_cards << Card.new(14, :club)
# player_cards << Card.new(13, :diamond)
#
# community_cards = Deck.new
# # community_cards << Card.new(10, :diamond)
#
# x = pair_odd player_cards, community_cards
# puts x

# ranks = 100000.times.map do
#   cards = FullDeck.new.deal(5)
#   hand = PokerHand.new cards
#   hand.rank
# end
#
# puts ranks.group_by(&:itself).map { |k,v| [k, v.size]}

def deal_and_rank
  full_deck = FullDeck.new
  cards = full_deck.deal(5)
  hand = PokerHand.new cards
  hand.rank
end

# 100000.times do
#   puts :straight_flush if deal_and_rank == :straight_flush
# end

puts Benchmark.measure {
  100000.times { deal_and_rank }
}
