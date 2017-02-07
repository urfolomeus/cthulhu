defmodule RollerTest do
  use ExUnit.Case

  import Roller

  test "rolling a d6 returns an integer between 1 and 6" do
    result = roll("d6")

    # Run this a few times each run so that we're more likely to catch bugs
    # in the pseudo random number generation
    for _ <- 1..10 do
      assert is_integer(result)
      assert result >= 1
      assert result <= 6
    end
  end
end
