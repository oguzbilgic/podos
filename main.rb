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

ranks = 100000.times.map do
  cards = FullDeck.new.deal(5)
  hand = PokerHand.new cards
  hand.rank
end

puts ranks.group_by(&:itself).map { |k,v| [k, v.size]}

  # 1000.times do
  #   cards = FullDeck.new.deal(5)
  #   hand = PokerHand.new cards
  #   if hand.rank != :high_card && hand.rank != :pair
  #     puts "#{hand.rank} #{hand}"
  #   end
  # end
