defmodule Foodie.Cli.Server do
  use GenServer

  defstruct [:source, :data]

  alias Foodie.Cli.Server
  alias Foodie.Cli.Query

  # client

  def start_link(opts \\ []) do
    new_data = Query.load()
    GenServer.start_link(__MODULE__, new_data, id: opts)
  end

  # {:ok, pid} = GenServer.start_link(__MODULE__, [])

  def query(pid, food_type) do
    GenServer.call(pid, {:query, food_type})
  end

  # Callbacks

  @impl true
  def init(data) do
    {:ok, %Server{data: data}}
  end

  @impl true
  def handle_call({:query, food_type}, _from, state) do
    case Query.match_food(state.data, food_type) do
      {:ok, results} ->
        {:reply, results, state}

      {_} ->
        {:reply, :error, state}
    end
  end

  @impl true
  def handle_cast({:load_default_data}, state) do
    new_load = Query.load()
    {:noreply, %__MODULE__{state | data: new_load}}
  end
end
