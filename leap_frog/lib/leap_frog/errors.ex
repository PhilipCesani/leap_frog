defmodule LeapFrog.Errors do
  # not a 4 letter word in dict
  # not a leap

  #HW - stitch error condictions together if good -> make move, else stitch errors together
  # server is going to use this mod to check for errors
  # go to elixir schools to learn the with command

  def not_a_word(word) do
    if LeapFrog.Dictionary.member?(word) do
      {:ok, word}
    else
      {:error, "#{word} is not in our dictionary."}
    end
  end

  def not_a_leap(old, new) do
    is_leap =
      old
      |> String.graphemes()
      |> Enum.zip(String.graphemes(new))
      |> Enum.filter(fn {x,y} -> x != y end)
      |> Enum.count()
      |> Kernel.==(1)
    if is_leap do
      {:ok, new}
    else
      {:error, "Not at a leap"}
    end
  end

end
