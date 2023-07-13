##ToDo - Add converter to "show" the data in a pretty way

defmodule LeapFrog.Game do
  defstruct [:answer, leaps: []]

  def new(answer, start) do
    %__MODULE__{answer: answer, leaps: [start]}
  end

  def hop(game, leap) do
    %{game| leaps: [leap|game.leaps]}
  end

  def show([]), do: IO.puts("")
  def show([head|tail]) do
    IO.puts(head)
    show(tail)
  end

end
