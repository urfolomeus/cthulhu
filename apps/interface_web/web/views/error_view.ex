defmodule InterfaceWeb.ErrorView do
  use InterfaceWeb.Web, :view

  @lint {Credo.Check.Readability.Specs, false}
  def render("404.html", _assigns) do
    "Page not found"
  end

  @lint {Credo.Check.Readability.Specs, false}
  def render("500.html", _assigns) do
    "Internal server error"
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  @lint {Credo.Check.Readability.Specs, false}
  def template_not_found(_template, assigns) do
    render "500.html", assigns
  end
end
