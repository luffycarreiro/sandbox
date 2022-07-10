defmodule SandboxWeb.AccountController do
  @moduledoc false
  use SandboxWeb, :controller

  alias Sandbox.Accounts

  @spec list(Plug.Conn.t(), any) :: Plug.Conn.t()
  def list(conn, _params) do
    accounts = Accounts.list_accounts(conn)
    json(conn, accounts)
  end

  @spec get(Plug.Conn.t(), map) :: Plug.Conn.t()
  def get(conn, %{"account_id" => account_id}) do
    case Accounts.get_account(conn, account_id) do
      {:ok, account} ->
        json(conn, account)

      _ ->
        send_resp(conn, 404, "account_id not found")
    end
  end

  @spec detail(Plug.Conn.t(), map) :: Plug.Conn.t()
  def detail(conn, %{"account_id" => account_id}) do
    case Accounts.detail(conn, account_id) do
      {:ok, account} ->
        json(conn, account)

      _ ->
        send_resp(conn, 404, "account_id not found")
    end
  end
end
