defmodule Roller do
  @moduledoc """
  Responsible for making dice roles.
  """

  @doc """
  Parses the given roll string, rolls the result and returns it.
  """
  @spec roll(String.t(), function) :: integer
  def roll(die_string, rand \\ :rand)
  def roll("d" <> die, rand), do: roll("1d" <> die, rand)
  def roll(die_string, rand) do
    roll_dice(String.split(die_string, "d"), rand)
  end

  defp roll_dice([amount_string, die_string], rand) do
    amount = String.to_integer(amount_string)
    roll = rand.uniform(String.to_integer(die_string))
    amount * roll
  end
end
