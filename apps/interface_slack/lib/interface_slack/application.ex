defmodule InterfaceSlack.Application do
  @moduledoc false

  use Application

  @lint {Credo.Check.Readability.Specs, false}
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    slack_token = Application.get_env(:interface_slack, :slack_api_token)

    children = [
      worker(Slack.Bot, [InterfaceSlack.Slacker, [], slack_token]),
    ]

    opts = [strategy: :one_for_one, name: InterfaceSlack.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
