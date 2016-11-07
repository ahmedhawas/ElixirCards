defmodule Cards do
  # module is a collection of functions
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for value <- values, suit <- suits do # generates a nested loop
      "#{value} of #{suit}"
    end
  end

  def shuffle(deck) do
    # method has an arity of 1
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
