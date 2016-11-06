defmodule Cards do
  # module is a collection of functions
  def create_deck do
    ["Ace", "Two", "Three"]
  end

  def shuffle(deck) do
    # method has an arity of 1
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
end
