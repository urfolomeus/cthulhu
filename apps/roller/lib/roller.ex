defmodule Roller do
  @moduledoc """
  Responsible for making dice roles.
  """

  @doc """
  Parses the given roll string, rolls the result and returns it.
  """
  @spec roll(String.t(), function) :: integer
  def roll(die_string, rand \\ :rand) do
    regex = ~r/^(?<amount>\d*)d(?<die>\d+)(?<mod>\+|-*)(?<value>\d*)$/
    captures = Regex.named_captures(regex, die_string)

    do_roll(captures, rand)
  end

  defp do_roll(nil, _rand), do: raise ArgumentError, message: "Invalid die string"
  defp do_roll(%{"amount" => "", "die" => d, "mod" => m, "value" => v}, rand) do
    do_roll(%{"amount" => "1", "die" => d, "mod" => m, "value" => v}, rand)
  end
  defp do_roll(%{"amount" => a, "die" => d, "mod" => ""}, rand) do
    roll_dice(a, d, rand)
  end
  defp do_roll(%{"amount" => a, "die" => d, "mod" => m, "value" => ""}, rand) do
    do_roll(%{"amount" => a, "die" => d, "mod" => m, "value" => "0"}, rand)
  end
  defp do_roll(%{"amount" => a, "die" => d, "mod" => "+", "value" => v}, rand) do
    value  = String.to_integer(v)
    roll_dice(a, d, rand) + value
  end
  defp do_roll(%{"amount" => a, "die" => d, "mod" => "-", "value" => v}, rand) do
    value  = String.to_integer(v)
    roll_dice(a, d, rand) - value
  end

  defp roll_dice(a, d, rand) do
    amount = String.to_integer(a)
    die    = String.to_integer(d)

    roll = rand.uniform(die)

    amount * roll
  end
end
