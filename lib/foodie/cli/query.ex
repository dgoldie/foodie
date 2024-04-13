defmodule Foodie.Cli.Query do
  # use Genserver

  @filename "data/Mobile_Food_Facility_Permit.csv"

  def load() do
    # File.stream!(@filename, [read_ahead: 100_000], 1000) |> CSV.decode()
    File.stream!(@filename)
    |> CSV.decode!(headers: true)
    |> Enum.take(10000)
  end

  def match_food(food_type) do
    load()
    |> Enum.filter(fn map ->
      if map["FoodItems"] |> String.contains?(food_type) do
        true
      else
        false
      end
    end)
  end
end
