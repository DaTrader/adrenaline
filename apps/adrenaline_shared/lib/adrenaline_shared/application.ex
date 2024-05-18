defmodule AdrenalineShared.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
#    children = [
#    ]

    Supervisor.start_link([], strategy: :one_for_one, name: AdrenalineShared.Supervisor)
  end
end