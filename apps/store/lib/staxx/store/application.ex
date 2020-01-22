defmodule Staxx.Store.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children =
      [
        Staxx.Store.Repo,
        #Staxx.Store.EventHandler
      ] ++ Staxx.Store.Testchain.SnapshotsStore.child_spec()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Staxx.Store.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
