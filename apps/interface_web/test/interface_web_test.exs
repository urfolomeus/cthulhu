defmodule InterfaceWebTest do
  use ExUnit.Case
  doctest InterfaceWeb

  test "greets the world" do
    assert InterfaceWeb.hello() == :world
  end
end
