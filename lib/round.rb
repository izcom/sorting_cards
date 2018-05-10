require './lib/card'
require './lib/deck'
require 'pry'

class Round

  attr_accessor :deck
                :guesses
                :number_correct
                :percent_correct
                :current_card

  def initialize(deck)
    @deck = deck
    @guesses = []
    @number_correct = 0
    short = @deck.instance_variable_get(:@cards)
    @current_card = short[0]
    # initializes to the first card in the deck
  end

  def record_guess(guess)
    @guesses << guess
    @deck.shift
  end

  def current_card
    short = @deck.instance_variable_get(:@cards)
    @current_card = short[0]
    # returns the first card in @cards
  end

  def guesses
    @guesses
  end

  def number_correct
    total = 0
    @guesses.each do |guess|
      if guess.correct? == true
        @number_correct += 1
        total += 1
      end
    end
    return total
  end

  def percent_correct
    puts "Number correct: " + @number_correct.to_s
    percent = 0
    if @number_correct > 0.0
      percent = @guesses.count.to_f / @number_correct.to_f
    end
    return percent
  end

end
