defmodule KogniChallenge.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      KogniChallengeWeb.Telemetry,
      # Start the Ecto repository
      KogniChallenge.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: KogniChallenge.PubSub},
      # Start Finch
      {Finch, name: KogniChallenge.Finch},
      # Start the Endpoint (http/https)
      KogniChallengeWeb.Endpoint
      # Start a worker by calling: KogniChallenge.Worker.start_link(arg)
      # {KogniChallenge.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: KogniChallenge.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    KogniChallengeWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
