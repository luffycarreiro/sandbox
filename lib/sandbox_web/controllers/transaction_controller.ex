defmodule SandboxWeb.TransactionController do
  @moduledoc false
  use SandboxWeb, :controller

  alias Sandbox.Transactions

  @spec list(Plug.Conn.t(), any) :: Plug.Conn.t()
  def list(conn, %{"account_id" => account_id, "count" => count, "from_id" => from_id}) do
    case Transactions.filter_transactions(conn, account_id, from_id, count) do
      {:ok, transactions} ->
        json(conn, transactions)

      :error ->
        send_resp(conn, 404, "account_id not found")

      {:error, error} ->
        send_resp(conn, 400, error)
    end
  end

  def list(conn, %{"account_id" => account_id}) do
    case Transactions.list_transactions(conn, account_id) do
      {:ok, transactions} ->
        json(conn, transactions)

      _ ->
        send_resp(conn, 404, "account_id not found")
    end
  end

  @spec get(Plug.Conn.t(), map) :: Plug.Conn.t()
  def get(conn, %{"account_id" => account_id, "transaction_id" => transaction_id}) do
    case Transactions.get_transaction(conn, account_id, transaction_id) do
      {:ok, transaction} ->
        json(conn, transaction)

      _ ->
        send_resp(conn, 404, "transaction_id not found")
    end
  end

  @spec balances(Plug.Conn.t(), map) :: Plug.Conn.t()
  def balances(conn, %{"account_id" => account_id}) do
    case Transactions.get_balance(conn, account_id) do
      {:ok, balance} ->
        json(conn, balance)

      _ ->
        send_resp(conn, 404, "account_id not found")
    end
  end
end
