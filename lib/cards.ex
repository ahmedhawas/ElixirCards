defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """
  # module is a collection of functions
  @doc """
    returns a list of strings of deck of playing cards
  """
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

  @doc """
    determines if a deck contains a given card

    ### Examples

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck, "Ace of Spades")
      true

  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  @doc """
    divides a deck into a hand and the remainder of the deck
    The `hand_size` is the number of cards returned to the hand..
    ### Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    # using erlang to write to the file system
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      # using pattern matching
      # :ok and :error is an example of an atom
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does not exist"
      # _ is used to say the variable is not used
    end
  end

  def create_hand(hand_size) do
    # uses the pipe operator to chain methods
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
    # deck gets passed in the chain
    # methods must take consistant first arguments
  end
end

# pattern matching is elixir's replacement for variable assignment
