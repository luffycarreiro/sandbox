defmodule SandboxWeb.ChartLive do
  @moduledoc """
  Live view for painting on a graph the number of times an account endpoint it is used.
  We subscribe to a topic called sandbox_chart and sent to it a broadcast.
  """
  use SandboxWeb, :live_view

  @impl Phoenix.LiveView
  def mount(_params, _session, socket) do
    if connected?(socket) do
      SandboxWeb.Endpoint.subscribe("sandbox_chart")
    end

    {:ok, assign(socket, :account, %{})}
  end

  @impl Phoenix.LiveView
  def render(assigns) do
    ~H"""
    <div>
      <canvas
        id="chart-canvas"
        phx-update="ignore"
        phx-hook="LineChart"></canvas>
    </div>
    """
  end

  @impl Phoenix.LiveView
  def handle_info(%{account: %{id: id}}, socket) do
    socket = update(socket, :account, &Map.update(&1, id, 1, fn x -> x + 1 end))

    {:noreply,
     push_event(
       socket,
       "new-point",
       %{label: id, value: socket.assigns.account[id]}
     )}
  end
end
