defmodule Foodie.Cli.QueryTest do
  use ExUnit.Case
  # doctest Query

  alias Foodie.Cli.Query

  test "match 'Tacos'" do
    {:ok, result} = Query.match_food("Tacos")
    assert 59 == result |> Enum.count()
  end
end
