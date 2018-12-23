require 'benchmark'
require 'podos'

def deal_and_rank
  full_deck = Podos::FullDeck.new
  cards = full_deck.deal(5)
  hand = Podos::PokerHand.new cards
  hand.rank
end

# 100000.times do
#   puts :straight_flush if deal_and_rank == :straight_flush
# end

puts Benchmark.measure {
  100000.times { deal_and_rank }
}
