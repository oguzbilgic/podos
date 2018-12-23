# Podos

Elegant poker hand ranker written in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'podos'
```

## Usage

```ruby
require 'podos'

full_deck = Podos::FullDeck.new
cards = full_deck.deal(5)
hand = Podos::PokerHand.new cards
hand.rank
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/oguzbilgic/podos.
