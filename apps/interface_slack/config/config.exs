use Mix.Config

config :interface_slack, :slack_api_token, System.get_env("SLACK_API_TOKEN")

import_config "#{Mix.env}.exs"
