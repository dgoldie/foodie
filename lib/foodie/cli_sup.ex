defmodule Foodie.CliSup do
  use Supervisor

  def start_link(start_numbers) do
    Supervisor.start_link(__MODULE__, start_numbers, name: __MODULE__)
  end

  @impl true
  def init(start_numbers) do
    children =
      for start_number <- start_numbers do
        # We can't just use `{OurNewApp.Counter, start_number}`
        # because we need different ids for children
        Supervisor.child_spec({Foodie.Cli.Server, start_number}, id: start_number)
      end

    Supervisor.init(children, strategy: :one_for_one)
  end
end
