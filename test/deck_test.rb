require './lib/card'
require './lib/deck'
require 'minitest/autorun'
require 'minitest/pride'

class Deck_Test < MiniTest::Test

  def test_if_exists
    card_1 = Card.new("3","Hearts")
    card_2 = Card.new("4", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_instance_of Deck, deck
  end

  def test_deck_cards_instance
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_instance_of Card, deck.cards[0]
  end

  def test_count_method
    card_1 = Card.new("5", "Spades")
    card_2 = Card.new("7", "Hearts")
    card_3 = Card.new("8", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal true, deck.count == 3
  end

  def test_shift
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("3", "Hearts")
    card_3 = Card.new("10", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal true, deck.shift == [card_3, card_1, card_2]
  end

  def test_sort_method
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal true, deck.sort(card_1, card_2, card_3) == [card_2, card_1, card_3]
  end

  def test_split
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal true, deck.split_cards_in_half == [[card_1, card_2],[card_3]]
  end

  def test_merge_sort
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    # binding.pry
    assert_equal true, deck.merge_sort == [card_2, card_1, card_3]
  end

  def test_split_cards_in_half
    card_1 = Card.new("4","Hearts")
    card_2 = Card.new("3", "Clubs")
    card_3 = Card.new("5", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal true, deck.split_cards_in_half == [[card_1, card_2], [card_3]]
  end

end
