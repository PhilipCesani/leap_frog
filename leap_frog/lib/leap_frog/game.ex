defmodule LeapFrog.Game do
  defstruct [:answer, leaps: []]

  def new(answer, start) do
    %__MODULE__{answer: answer, leaps: [start]}
  end

  def hop(game, leap) do
    %{game| leaps: [leap|game.leaps]}
  end

  def show(%{answer: answer, leaps: [answer | _rest]} = game) do
    game.leaps
      |> Enum.reverse
      |> Enum.join(" |> ")
  end

  def show(game) do
    left =
      game.leaps
      |> Enum.reverse
      |> Enum.join(" |> ")
    right = "... #{game.answer}"
    left <> right
  end

end
