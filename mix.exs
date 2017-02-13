defmodule Cthulhu.Mixfile do
  use Mix.Project

  @moduledoc false

  def project do
    [apps_path: "apps",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  defp deps do
    [{:credo, "~> 0.5", only: [:dev, :test]},
     {:distillery, "~> 1.0"}]
  end
end
