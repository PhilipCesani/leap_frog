defmodule LeapFrog.Server do
  use GenServer
  @name Frog

  ## Server
  @impl true
  def init({answer, start}) do
     {:ok,LeapFrog.Game.new(answer, start)}
  end

  @impl true
  def handle_call({:leap, word}, _from, game) do
    new_game = LeapFrog.Game.hop(game,word)
    {:reply, LeapFrog.Game.show(new_game), new_game}
  end




  ## Client
  def start_link({answer, start}) do
    GenServer.start_link(__MODULE__, {answer, start}, name: @name)
  end

  def take_leap(pid \\ @name, leap) do
    GenServer.call(pid, {:leap, leap})
    |> IO.puts
  end
end
