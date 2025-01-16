defmodule Amrap.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AmrapWeb.Telemetry,
      Amrap.Repo,
      {DNSCluster, query: Application.get_env(:amrap, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Amrap.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Amrap.Finch},
      # Start a worker by calling: Amrap.Worker.start_link(arg)
      # {Amrap.Worker, arg},
      # Start to serve requests, typically the last entry
      AmrapWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Amrap.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AmrapWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
