defmodule CardsTest do
  use ExUnit.Case
  doctest Cards
  # This runs tests from the documentation examples

  test "create_deck makes 20 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length === 20
  end

  test "shufflling a deck randomizes it" do
    deck_one = Cards.create_deck
    deck_two = Cards.create_deck
    assert deck_one != Cards.shuffle(deck_one) || deck_two != Cards.shuffle(deck_two)
  end
end
