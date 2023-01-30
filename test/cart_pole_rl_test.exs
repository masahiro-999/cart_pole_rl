defmodule CartPoleRlTest do
  use ExUnit.Case
  doctest CartPoleRl

  test "greets the world" do
    assert CartPoleRl.hello() == :world
  end
end
