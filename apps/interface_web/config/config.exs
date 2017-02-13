use Mix.Config

config :interface_web, InterfaceWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "6IY5TrQxxO8DDp3T7t25w6Ss+eiAJ1U8u5027KfgqmtIXCKD+CWL2bh2WVuBdvCq",
  render_errors: [view: InterfaceWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: InterfaceWeb.PubSub,
           adapter: Phoenix.PubSub.PG2],
  server: true

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

import_config "#{Mix.env}.exs"
