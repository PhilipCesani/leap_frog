defmodule LeapFrog.Errors do
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

  def check_word(old, word) do
    with {:ok, word} <- not_a_word(word),
         {:ok, word} <- not_a_leap(old, word)
    do
      {:ok, word}
    else
      error -> error
    end
  end
end
