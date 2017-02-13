defmodule InterfaceWeb do
  use Application

  @moduledoc false

  @lint false
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      supervisor(InterfaceWeb.Endpoint, []),
      # Start your own worker by calling: InterfaceWeb.Worker.start_link(arg1, arg2, arg3)
      # worker(InterfaceWeb.Worker, [arg1, arg2, arg3]),
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InterfaceWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @lint false
  def config_change(changed, _new, removed) do
    InterfaceWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
