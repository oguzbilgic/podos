require 'test/unit'
require './poker_hand.rb'

class PokerHandTest < Test::Unit::TestCase
  def setup
    # @dog = Dog.new
  end

  def test_barks
    assert_equal "woof", @dog.bark
  end

  def test_doesnt_bark_when_dead
    @dog.die
    assert_raises DeadError do
      @dog.bark
    end
  end
end
