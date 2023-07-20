defmodule LeapFrog.Dictionary do
  @words LeapFrog.Words.list()
  @dict MapSet.new(@words)

  def random do
    Enum.random(@words)
  end

  def member?(word) do
    MapSet.member?(@dict, word)
  end

end
