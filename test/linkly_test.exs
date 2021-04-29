defmodule LinklyTest do
  use ExUnit.Case
  doctest Linkly

  test "greets the world" do
    assert Linkly.hello() == :world
  end
end
