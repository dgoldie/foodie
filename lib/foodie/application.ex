defmodule Foodie.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      FoodieWeb.Telemetry,
      # # Start the Ecto repository
      Foodie.Repo,
      # # Start the PubSub system
      {Phoenix.PubSub, name: Foodie.PubSub},
      # # Start Finch
      {Finch, name: Foodie.Finch},
      # # Start the Endpoint (http/https)
      FoodieWeb.Endpoint,
      # Start a worker by calling: Foodie.Worker.start_link(arg)
      # {Foodie.Worker, arg}
      {Foodie.CliSup, [10000, 20000]}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Foodie.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FoodieWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
