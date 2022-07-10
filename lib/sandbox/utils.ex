defmodule Sandbox.Utils do
  @moduledoc """
  Utils for contexts
  """

  @doc false
  @spec get_links(map, binary, :account | :details | :balances | :transactions) :: map
  def get_links(conn, account_id, :account) do
    %{
      balances: "#{get_host(conn)}/accounts/#{account_id}/balances",
      details: "#{get_host(conn)}/accounts/#{account_id}/details",
      self: "#{get_host(conn)}/accounts/#{account_id}",
      transactions: "#{get_host(conn)}/accounts/#{account_id}/transactions"
    }
  end

  def get_links(conn, account_id, :details) do
    %{
      self: "#{get_host(conn)}/accounts/#{account_id}/details",
      account: "#{get_host(conn)}/accounts/#{account_id}"
    }
  end

  def get_links(conn, account_id, :transactions) do
    %{
      self: "#{get_host(conn)}/accounts/#{account_id}/transactions",
      account: "#{get_host(conn)}/accounts/#{account_id}"
    }
  end

  def get_links(conn, account_id, :balances) do
    %{
      self: "#{get_host(conn)}/accounts/#{account_id}/balances",
      account: "#{get_host(conn)}/accounts/#{account_id}"
    }
  end

  @spec get_host(map) :: binary
  defp get_host(%{scheme: :http} = conn) do
    "http://#{conn.host}:#{conn.port}/teller_sandbox"
  end

  defp get_host(conn) do
    "https://#{conn.host}/teller_sandbox"
  end
end
