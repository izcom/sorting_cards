require './lib/card'
# require './lib/deck'
require './lib/guess'
require 'minitest/autorun'
require 'minitest/pride'

class Guess_Test < MiniTest::Test

  def test_if_exists
    card = Card.new("8", "Clubs")
    guess = Guess.new("King of Hearts", card)
    assert_instance_of Guess, guess
  end

  def test_feedback_method
    card = Card.new("9", "Diamonds")
    right_guess = Guess.new("9 of Diamonds", card)
    wrong_guess = Guess.new("Ace of Spades", card)
    assert_equal 0, right_guess.feedback <=> "Correct!"
  end

  def test_response
    card = Card.new("3", "Spades")
    guess = Guess.new("9 of Clubs", card)
    assert_equal true, guess.response == "9 of Clubs"
  end

  # working
  def test_card_value
    card = Card.new("4", "Hearts")
    assert_equal true, card.value == "4"
  end

  # working
  def test_card_suit
    card = Card.new("5", "Spades")
    assert_equal true, card.suit == "Spades"
  end

  def test_guess_card
    card = Card.new("10", "Jacks")
    card.inspect
  end

  def test_guess_correct
    card = Card.new("9", "Diamonds")
    guess = Guess.new("9 of Diamonds", card)
    assert_equal true, guess.correct? == true
  end

end
