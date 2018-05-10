# return an array of guesses!

require './lib/card'

class Guess

  attr_reader :card,
              :value
              :suit
              :card_as_str

  def initialize(card_as_str, card)
    @card = card
    @value = card.value
    @suit = card.suit
    @card_as_str = card_as_str # ex: King of Hearts
  end

  def response
    return @card_as_str
  end

  def feedback
    if @card_as_str == card.convert_to_string
      return "Correct!"
    else
      return "Incorrect!"
    end
  end

  def correct?
    if @card_as_str == @card.convert_to_string
      #binding.pry
      true
    else
      false
    end
  end

end
