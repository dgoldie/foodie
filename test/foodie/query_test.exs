defmodule Foodie.Cli.QueryTest do
  use ExUnit.Case
  # doctest Query

  alias Foodie.Cli.Query

  test "match 'Tacos'" do
    assert 59 == Query.match_food("Tacos") |> Enum.count()
  end
end
