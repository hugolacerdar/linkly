use Mix.Config

config :linkly, :ecto_repos, [Linkly.Repo]

import_config "#{Mix.env()}.exs"
