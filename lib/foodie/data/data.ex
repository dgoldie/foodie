# defmodule Foodie.Data do
#   # use Genserver

#   @file data/Mobile_Food_Facility_Permit.csv

#   # def init(_) do
#   #   {:ok, []]}
#   # end

#   def load() do
#     File.stream!(@file, [read_ahead: 100_000], 1000) |> CSV.decode()
#   end

# end
