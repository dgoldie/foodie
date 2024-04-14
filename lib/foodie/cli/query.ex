defmodule Foodie.Cli.Query do
  # use Genserver

  @filename "data/Mobile_Food_Facility_Permit.csv"

  def load() do
    # File.stream!(@filename, [read_ahead: 100_000], 1000) |> CSV.decode()
    File.stream!(@filename)
    |> CSV.decode!(headers: true)
    |> Enum.take(10000)
  end

  def match_food(data \\ load(), food_type) do
    try do
      result =
        data
        |> Enum.filter(fn map ->
          if map["FoodItems"] |> String.contains?(food_type) do
            true
          else
            false
          end
        end)

      {:ok, result}
    rescue
      _ -> :error
    end
  end
end
