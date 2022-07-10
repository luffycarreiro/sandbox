defmodule SandboxWeb.AuthController do
  @moduledoc """
  Controller in charge of authentication for the api.
  """

  use SandboxWeb, :controller

  alias Plug.Conn
  alias Sandbox.Accounts

  @doc """
  Authenticates the the token has to be test_string after test the token must not have any special chars like _.
  Also adds the accounts into the socket.

  Even though I don't like to do many things on the same function it seems apropiate as accounts are going
  to be need it every single request.
  """
  @spec get_accounts_from_auth_token(Conn.t(), Keyword.t()) :: Conn.t()
  def get_accounts_from_auth_token(conn, _opts) do
    with {user, _pass} <- Plug.BasicAuth.parse_basic_auth(conn),
         ["test", token] <- String.split(user, "_") do
      accounts = Accounts.get_accounts_from_token(token)

      conn
      |> assign(:accounts, accounts)
      |> assign(:host, conn.host)
      |> assign(:port, conn.port)
      |> assign(:scheme, conn.scheme)
      |> assign(:token, token)
    else
      _ -> conn |> Plug.BasicAuth.request_basic_auth() |> halt()
    end
  end
end
