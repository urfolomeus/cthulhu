defmodule Roller do
  @moduledoc """
  Responsible for making dice roles.
  """

  @doc """
  Rolls the given dice. Returns an integer.
  """
  @spec roll(String.t()) :: integer
  def roll("d" <> die) do
    roll_dice(String.to_integer(die))
  end

  @spec roll_dice(integer) :: integer
  defp roll_dice(die) do
    :rand.uniform(die)
  end
end
