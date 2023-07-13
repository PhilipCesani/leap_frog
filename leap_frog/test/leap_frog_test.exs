defmodule LeapFrogTest do
  use ExUnit.Case
  doctest LeapFrog

  test "greets the world" do
    assert LeapFrog.hello() == :world
  end
end
