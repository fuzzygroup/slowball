ExUnit.start

Mix.Task.run "ecto.create", ~w(-r Catcher.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r Catcher.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(Catcher.Repo)

