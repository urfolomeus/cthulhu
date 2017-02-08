defmodule RollerTest do
  @moduledoc """
  Tests for the Roller module
  """

  use ExUnit.Case

  import Roller

  setup do
    stub_rand = Stubr.stub!([uniform: fn _ -> 4 end], module: :rand)
    {:ok, [stub_rand: stub_rand]}
  end

  test "rolling 'd' throws an argument error", %{stub_rand: stub_rand} do
    assert_raise(ArgumentError, fn -> roll("d", stub_rand) end)
  end

  test "rolling 'd4' returns the randomly rolled value", %{stub_rand: stub_rand} do
    assert roll("d4", stub_rand) == 4
  end

  test "rolling '1d' throws an argument error", %{stub_rand: stub_rand} do
    assert_raise(ArgumentError, fn -> roll("1d", stub_rand) end)
  end

  test "rolling '1d4' returns the randomly rolled value", %{stub_rand: stub_rand} do
    assert roll("1d4", stub_rand) == 4
  end

  test "rolling '2d4' returns two randomly rolled values added together", %{stub_rand: stub_rand} do
    assert roll("2d4", stub_rand) == 8
  end

  test "rolling '30d4' returns thirty randomly rolled values added together", %{stub_rand: stub_rand} do
    assert roll("30d4", stub_rand) == 120
  end

  test "rolling '1d4+' returns the randomly rolled value plus 0", %{stub_rand: stub_rand} do
    assert roll("1d4+", stub_rand) == 4
  end

  test "rolling '1d4+2' returns the randomly rolled value plus 2", %{stub_rand: stub_rand} do
    assert roll("1d4+2", stub_rand) == 6
  end

  test "rolling '1d4+200' returns the randomly rolled value plus 200", %{stub_rand: stub_rand} do
    assert roll("1d4+200", stub_rand) == 204
  end

  test "rolling '1d4-' returns the randomly rolled value minus 0", %{stub_rand: stub_rand} do
    assert roll("1d4-", stub_rand) == 4
  end

  test "rolling '1d4-2' returns the randomly rolled value minus 2", %{stub_rand: stub_rand} do
    assert roll("1d4-2", stub_rand) == 2
  end

  test "rolling '1d4-200' returns the randomly rolled value minus 200", %{stub_rand: stub_rand} do
    assert roll("1d4-200", stub_rand) == -196
  end

  test "always rolls an integer between 1 and the given die's maximum" do
    for _ <- 1..10_000 do
      d4 = roll("1d4")

      assert is_integer(d4)
      assert d4 >= 1
      assert d4 <= 4
    end

    for _ <- 1..10_000 do
      d6 = roll("1d6")

      assert is_integer(d6)
      assert d6 >= 1
      assert d6 <= 6
    end

    for _ <- 1..10_000 do
      d8 = roll("1d8")

      assert is_integer(d8)
      assert d8 >= 1
      assert d8 <= 8
    end

    for _ <- 1..10_000 do
      d10 = roll("1d10")

      assert is_integer(d10)
      assert d10 >= 1
      assert d10 <= 10
    end

    for _ <- 1..10_000 do
      d12 = roll("1d12")

      assert is_integer(d12)
      assert d12 >= 1
      assert d12 <= 12
    end

    for _ <- 1..10_000 do
      d20 = roll("1d20")

      assert is_integer(d20)
      assert d20 >= 1
      assert d20 <= 20
    end

    for _ <- 1..10_000 do
      d100 = roll("1d100")

      assert is_integer(d100)
      assert d100 >= 1
      assert d100 <= 100
    end
  end

  test "rolling nonsense raises an argument error", %{stub_rand: stub_rand} do
    assert_raise(ArgumentError, fn -> roll("foo", stub_rand) end)
    assert_raise(ArgumentError, fn -> roll("12+1d4", stub_rand) end)
    assert_raise(ArgumentError, fn -> roll("12ad4m+", stub_rand) end)
    assert_raise(ArgumentError, fn -> roll("1d4+n", stub_rand) end)
  end
end
