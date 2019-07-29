defmodule Staxx.Proxy.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      Staxx.Proxy.Chain.Supervisor,
      Staxx.Proxy.Chain.Storage,
      {Registry, keys: :unique, name: Staxx.Proxy.ChainRegistry},
      Staxx.Proxy.NodeManager,
      Staxx.Proxy.Deployment.Supervisor
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Staxx.Proxy.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
