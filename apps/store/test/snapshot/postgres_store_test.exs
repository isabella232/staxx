defmodule Staxx.Store.PostgresTest do
  use Staxx.Store.StoreTestCase, adapter: Staxx.Store.Testchain.Adapters.Postgres

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Staxx.Store.Repo)
  end
end
