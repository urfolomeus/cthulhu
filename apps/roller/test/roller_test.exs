defmodule RollerTest do
  @moduledoc """
  Tests for the Roller module
  """

  use ExUnit.Case

  import Roller

  test "rolling a d6 with no specified number returns an integer between 1 and 6" do
    result = roll("d6")

    # Run this a few times each run so that we're more likely to catch bugs
    # in the pseudo random number generation
    for _ <- 1..10_000 do
      assert is_integer(result)
      assert result >= 1
      assert result <= 6
    end
  end

  test "rolling 1d6 returns an integer between 1 and 6" do
    result = roll("1d6")

    # Run this a few times each run so that we're more likely to catch bugs
    # in the pseudo random number generation
    for _ <- 1..10_000 do
      assert is_integer(result)
      assert result >= 1
      assert result <= 6
    end
  end

  test "rolling 2d6 returns an integer between 2 and 12" do
    result = roll("2d6")

    # Run this a few times each run so that we're more likely to catch bugs
    # in the pseudo random number generation
    for _ <- 1..10_000 do
      assert is_integer(result)
      assert result >= 2
      assert result <= 12
    end
  end
end
