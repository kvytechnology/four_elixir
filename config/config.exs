# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :four_elixir,
  ecto_repos: [FourElixir.Repo]

# Configures the endpoint
config :four_elixir, FourElixir.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "fRBfcwTXI+wPY7mCUecyQFPxd3sPkTobNuSl8JQFBk2Z2lE73ucP9kYmt852Yduh",
  render_errors: [view: FourElixir.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FourElixir.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
