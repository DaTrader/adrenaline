defmodule Adrenaline.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Adrenaline.Repo,
      {DNSCluster, query: Application.get_env(:adrenaline, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Adrenaline.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Adrenaline.Finch}
      # Start a worker by calling: Adrenaline.Worker.start_link(arg)
      # {Adrenaline.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Adrenaline.Supervisor)
  end
end
