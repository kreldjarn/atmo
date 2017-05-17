# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :music_geocache,
  ecto_repos: [MusicGeocache.Repo]

# Configures the endpoint
config :music_geocache, MusicGeocache.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PmuvLnILW8fHnNqae0lhWWlsPjPndNRzD+A5uv3KOYzDq/KM70T8xfLJwSY+YO22",
  render_errors: [view: MusicGeocache.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MusicGeocache.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]


config :guardian, Guardian,
  allowed_algos: ["HS512"],
  verify_module: Guardian.JWT,
  issuer: "MusicGeocache",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true,
  secret_key: "shush_this_is_a_dev_secret", #TODO
  serializer: MusicGeocache.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
