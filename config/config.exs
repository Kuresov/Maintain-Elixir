# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :maintain,
  ecto_repos: [Maintain.Repo]

# Configures the endpoint
config :maintain, Maintain.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oFrel8jr9TMRCWtIxpO8GtNMWXLQsaXO+NLH8MbN2hxyrr3GfDWrdTg8UebLiE3q",
  render_errors: [view: Maintain.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Maintain.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
