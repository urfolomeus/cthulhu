defmodule InterfaceSlack do
  @moduledoc """
  Documentation for InterfaceSlack.
  """
  use Slack

  @spec handle_connect(function, function) :: tuple
  def handle_connect(slack, state) do
    IO.puts "Connected as #{slack.me.name}"
    {:ok, state}
  end

  @spec handle_event(map, function, function) :: tuple
  def handle_event(message = %{type: "message", text: "cthulhu roll " <> die_string}, slack, state) do
    result = Roller.roll(die_string)
    send_message("Rolled: #{result}", message.channel, slack)
    {:ok, state}
  end
  def handle_event(message = %{type: "message"}, slack, state) do
    IO.inspect message
    send_message("Ph'nglui mglw'nafh Cthulhu R'lyeh wgah'nagl fhtagn!", message.channel, slack)
    {:ok, state}
  end
  def handle_event(_, _, state), do: {:ok, state}

  @spec handle_info(map, function, function) :: tuple
  def handle_info({:message, text, channel}, slack, state) do
    IO.puts "Sending your message, great Cthulhu!"

    send_message(text, channel, slack)

    {:ok, state}
  end
  def handle_info(_, _, state), do: {:ok, state}
end
