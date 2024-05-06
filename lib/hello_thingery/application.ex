defmodule HelloThingery.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      HelloThingeryWeb.Telemetry,
      HelloThingery.Repo,
      {DNSCluster, query: Application.get_env(:hello_thingery, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: HelloThingery.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: HelloThingery.Finch},
      # Start a worker by calling: HelloThingery.Worker.start_link(arg)
      # {HelloThingery.Worker, arg},
      # Start to serve requests, typically the last entry
      HelloThingeryWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: HelloThingery.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    HelloThingeryWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
