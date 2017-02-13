defmodule InterfaceWeb.LandingController do
  use InterfaceWeb.Web, :controller

  @moduledoc false

  @spec index(any, any) :: String.t()
  def index(conn, _params) do
    render conn, "index.html"
  end
end
