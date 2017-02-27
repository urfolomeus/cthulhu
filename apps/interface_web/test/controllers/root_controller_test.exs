defmodule InterfaceWeb.RootControllerTest do
  use InterfaceWeb.ConnCase

  @moduledoc false

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Cthulhu"
  end
end
