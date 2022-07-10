defmodule SandboxWeb.PageController do
  @moduledoc false
  use SandboxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
