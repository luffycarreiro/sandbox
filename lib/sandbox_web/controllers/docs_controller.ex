defmodule SandboxWeb.DocsController do
  @moduledoc false
  use SandboxWeb, :controller

  def index(conn, _params) do
    html(conn, File.read!("doc/api-reference.html"))
  end
end
