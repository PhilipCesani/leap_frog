defmodule LeapFrog.Server do
  use GenServer

  @impl true
  def init({answer, start}) do
     {:ok,LeapFrog.Game.new(answer, start)}
  end

  @impl true
  def handle_call({:leap, word}, _from, game) do
    new_game = LeapFrog.Game.hop(game,word)
    {:reply, LeapFrog.Game.show(new_game), new_game}
  end




end
