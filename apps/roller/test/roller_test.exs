defmodule RollerTest do
  @moduledoc """
  Tests for the Roller module
  """

  use ExUnit.Case

  import Roller

  test "rolling a d6 with no specified number returns the randomly rolled value" do
    stub_rand = Stubr.stub!([uniform: fn _ -> 4 end], module: :rand)
    result = roll("d6", stub_rand)
    assert result == 4
  end

  test "rolling 1d6 returns the randomly rolled value" do
    stub_rand = Stubr.stub!([uniform: fn _ -> 3 end], module: :rand)
    result = roll("1d6", stub_rand)
    assert result == 3
  end

  test "rolling 2d6 returns two randomly rolled values added together" do
    stub_rand = Stubr.stub!([uniform: fn _ -> 5 end], module: :rand)
    result = roll("2d6", stub_rand)
    assert result == 10
  end

  test "rolling 3d6 returns three randomly rolled values added together" do
    stub_rand = Stubr.stub!([uniform: fn _ -> 5 end], module: :rand)
    result = roll("3d6", stub_rand)
    assert result == 15
  end
end
