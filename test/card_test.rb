require './lib/card'
require 'minitest/autorun'
require 'minitest/pride'

class Card_Test < Minitest::Test

  def test_if_exists
    card = Card.new("King", "3")
    assert_instance_of Card, card
  end

  def test_response
    card = Card.new("5", "Diamonds")
    assert_equal true, card.response == "5 of Diamonds"
  end

  def test_card_value
    card = Card.new("7", "Hearts")
    assert_equal true, card.value == "7"
  end

  def test_card_suit
    card = Card.new("2", "Spades")
    assert_equal true, card.suit == "Spades"
  end

end
