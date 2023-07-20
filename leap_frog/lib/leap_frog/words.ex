defmodule LeapFrog.Words do
  def list(filename \\ "priv/words.txt") do
    File.read!(filename) |> String.split()
  end
end
