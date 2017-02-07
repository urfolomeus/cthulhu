defmodule Roller do
  @moduledoc """
  Responsible for making dice roles.
  """

  @doc """
  Parses the given roll string, rolls the result and returns it.
  """
  @spec roll(String.t()) :: integer
  def roll("d" <> die), do: roll("1d" <> die)
  def roll(die_string) do
    roll_dice(String.split(die_string, "d"))
  end

  defp roll_dice([amount_string, die_string]) do
    amount = String.to_integer(amount_string)
    roll = :rand.uniform(String.to_integer(die_string))
    amount * roll
  end
end
