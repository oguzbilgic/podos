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

puts Card.from_str "2♦"


cards = FullDeck.new.deal(5)
p = PokerHand.new cards
puts cards
puts 'pair' if p.pair?
puts 'flush' if p.flush?

puts [2, 2, 1] === [1,2,2]
