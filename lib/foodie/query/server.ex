defmodule Foodie.Query.Server do
  # use Genserver

  # import Foodie.Data.List

  # def start do
  #   GenServer.start(QueryServer, nil)
  # end

  # def query(query_server, food_type) do
  #   GenServer.call(query_server_server, {:query, food_type})
  # end

  # def init(_) do
  #   {:ok}
  # end

  # def handle_call({:query, food_type, cli, cli_list}) do
  #   new_state = Foodie.Data.list().query(food_type)
  #   {:noreply, new_state}
  # end
end
