defmodule InterfaceSlack.Mixfile do
  use Mix.Project

  @moduledoc false

  def project do
    [app: :interface_slack,
     version: "0.1.0",
     build_path: "../../_build",
     config_path: "../../config/config.exs",
     deps_path: "../../deps",
     lockfile: "../../mix.lock",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger, :slack],
     mod: {InterfaceSlack.Application, []}]
  end

  defp deps do
    [{:roller, in_umbrella: true},
     {:slack, "~> 0.9.3"}]
  end
end
