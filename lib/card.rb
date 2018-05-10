require './lib/deck'
# Due Thursday at 8AM
# Rake file will make your life easier (not expected)
# don't use floats, ever if you can
# no jokers
# not building a full deck of cars, just model
# No user input

class Card

attr_reader :value,
            :suit

def initialize(value, suit)
  @value = value
  @suit = suit
  @response = value.to_s + " of " + suit.to_s
end

def count(deck)
  count = deck.count
end

def convert_to_string
  str = @value.to_s + " of " + @suit.to_s
end

end # end Card
