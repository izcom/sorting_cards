require "./lib/card"
require 'pry'

class Deck

  attr_accessor :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    num = @cards.count
  end

  def sort(card_1, card_2, card_3)
    # have to give them values to be able to compare
    low = card_1
    middle = card_2
    high = card_3
    @cards.each do |card|
      if card.instance_variable_get(:@value) < low.instance_variable_get(:@value)
        low = card
      end
    end

    @cards.each do |card|
      if card.instance_variable_get(:@value) > high.instance_variable_get(:@value)
        high = card
      end
    end

    @cards.each do |card|
      if card.instance_variable_get(:@value) > low.instance_variable_get(:@value) && card.instance_variable_get(:@value) < high.instance_variable_get(:@value)
        middle = card
      end
    end
    return [low, middle, high]
  end

  # if a guess is made, shift the deck one to the right
  def shift
    @cards = @cards.rotate(-1)
    return [@cards[0], @cards[1], @cards[2]]
  end

  def merge_sort
    # split cards in half
    sorted = []
    arr = []
    arr += split_cards_in_half
    # assign first half to arr[0], second half to arr[1]

    2.times do |index|
      if arr[index].count == 2
        swap(arr[index])
      end
      if arr[index].count == 1
        sorted << [compare_halves(arr[index], arr[index+1])]
        @cards.delete(sorted.last)
      end
    end
    return sorted
  end

  def swap(arr)
    temp = arr[0]
    if arr[1].value > arr[0].value
      temp = arr[1]
      arr[1] = arr[0]
      arr[0] = temp
    end
  end

  def split_cards_in_half
    half = @cards.count / 2 # rounds off to nearest integer
    first_half = @cards[0..half]
    second_half = @cards[half + 1, @cards.count - 1]
    split_string = [first_half, second_half]
  end

  def compare_halves(arr, arr2)
    if arr[1].nil?
      return
    end
    if arr[0].value > arr[1].value
      return arr[1]
    else
      return arr[0]
    end
  end

end # end Class
