require './lib/round'
require './lib/guess'
require 'minitest/autorun'
require 'minitest/pride'

class RoundTest < MiniTest::Test

  def test_if_exists
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("3", "Hearts")
    card_3 = Card.new("King", "Spades")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_instance_of Round, round
  end

  def test_values
    skip
    card_1 = Card.new("5", "Diamonds")
    card_2 = Card.new("7", "Hearts")
    card_3 = Card.new("King", "Spades")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
  end

  def test_round_deck
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("7", "Spades")
    card_3 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal true, round.deck.eql?(deck)
  end

  def test_guesses_count
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("7", "Spades")
    card_3 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess = Guess.new("9 of Clubs", card_1)
    round.record_guess(guess)
    assert_equal true, round.guesses.count == 1
  end

  def test_record_guess
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("7", "Spades")
    card_3 = Card.new("Ace", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess = Guess.new("9 of Clubs", card_1)
    round.record_guess(guess)
    assert_equal true, round.guesses.include?(guess)
  end

  def test_current_card
    # first card is current card
    card_1 = Card.new("4", "Diamonds")
    card_2 = Card.new("7", "Spades")
    card_3 = Card.new("Queen", "Hearts")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert round.current_card, card_1
  end

  def test_round_guesses_first_feedback
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("3", "Hearts")
    card_3 = Card.new("10", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess = Guess.new("9 of Clubs", card_1)
    round.record_guess(guess)
    round.guesses.count
    round.guesses.first.feedback == "Correct!"
  end

  def test_guesses_empty
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("3", "Hearts")
    card_3 = Card.new("10", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    assert_equal true, round.guesses == []
  end

  def test_guesses_with_value
    card_1 = Card.new("2", "Hearts")
    card_2 = Card.new("3", "Hearts")
    card_3 = Card.new("10", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess = Guess.new("9 of Clubs", card_1)
    round.record_guess(guess)
    assert_equal true, round.guesses == [guess]
  end

  def test_number_correct_
    card_1 = Card.new("9", "Clubs")
    card_2 = Card.new("3", "Hearts")
    card_3 = Card.new("10", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess = Guess.new("9 of Clubs", card_1)
    round.record_guess(guess)
    assert_equal true, round.number_correct == 1
  end

  def test_percent_correct
    card_1 = Card.new("9", "Clubs")
    card_2 = Card.new("3", "Hearts")
    card_3 = Card.new("10", "Diamonds")
    deck = Deck.new([card_1, card_2, card_3])
    round = Round.new(deck)
    guess_1 = Guess.new("9 of Clubs", card_1)
    guess_2 = Guess.new("10 of Hearts", card_2)
    round.record_guess(guess_1)
    round.record_guess(guess_2)
    assert_equal true, round.percent_correct == 50.0
  end

end
