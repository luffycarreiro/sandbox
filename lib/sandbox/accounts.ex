defmodule Sandbox.Accounts do
  @moduledoc """
  Context for accounts
  """

  alias Phoenix.PubSub

  alias Sandbox.Accounts.Account
  alias Sandbox.Accounts.AccountDetail
  alias Sandbox.Utils

  @doc """
  List accounts. Depending on the provided token between returns between 1 and 8 accounts.

  It will return the same data if the same token is passed.

  Here 2 kind of hashing algorithms are used.
    1) :erlang.phash2() Very usefull for getting an integer from any string.
    2) :crypto.hash(:md5, _) Used for calculating ID's.
  """

  @spec list_accounts(map) :: [%Sandbox.Accounts.Account{}]
  def list_accounts(conn) do
    Enum.map(conn.assigns.accounts, fn x ->
      numeric_token = :erlang.phash2(x)

      %Account{
        enrollment_id: get_enrollment(x),
        id: x,
        institution: get_institution(numeric_token),
        last_four: get_last_four(numeric_token),
        links: Utils.get_links(conn, x, :account),
        name: get_name(numeric_token)
      }
    end)
  end

  @doc """
  Returns one account.
  """
  @spec get_account(map, binary) :: {:ok, %Sandbox.Accounts.Account{}} | :error
  def get_account(conn, id) do
    if id in conn.assigns.accounts do
      PubSub.broadcast(Sandbox.PubSub, "sandbox_chart", %{account: %{id: id}})
      numeric_token = :erlang.phash2(id)

      {:ok,
       %Account{
         enrollment_id: get_enrollment(id),
         id: id,
         institution: get_institution(numeric_token),
         last_four: get_last_four(numeric_token),
         links: Utils.get_links(conn, id, :account),
         name: get_name(numeric_token)
       }}
    else
      :error
    end
  end

  @doc """
  Account detail.
  """
  @spec detail(map, binary) :: {:ok, %Sandbox.Accounts.AccountDetail{}} | :error
  def detail(conn, id) do
    if id in conn.assigns.accounts do
      numeric_token = :erlang.phash2(id)
      PubSub.broadcast(Sandbox.PubSub, "sandbox_chart", %{account: %{id: id}})

      {:ok,
       %AccountDetail{
         account_id: id,
         account_number: get_account_number(numeric_token),
         links: Utils.get_links(conn, id, :details),
         routing_numbers: %{ach: get_ach(numeric_token)}
       }}
    else
      :error
    end
  end

  @doc """
  Transforms the token into list of accounts ids.
  """
  @spec get_accounts_from_token(binary) :: list
  def get_accounts_from_token(token) do
    token
    |> :erlang.phash2()
    |> rem(Enum.count(Account.names()))
    |> get_accounts(token)
  end

  @doc false
  @spec get_accounts(number, binary) :: list
  def get_accounts(0, token), do: get_accounts(1, token)

  def get_accounts(number_of_accounts, token) do
    Enum.map(1..number_of_accounts, &transform_token_into_account(&1, token))
  end

  @doc """
  Hashes the token n times for different results
  """
  @spec transform_token_into_account(number, binary) :: binary
  def transform_token_into_account(times, token) do
    hash =
      0..times
      |> Enum.reduce(token, fn _, acc ->
        :crypto.hash(:md5, acc) |> Base.encode16(case: :lower)
      end)
      |> String.slice(0..20)

    "acc_" <> hash
  end

  @spec get_enrollment(binary) :: binary
  defp get_enrollment(account_id) do
    hash =
      :md5
      |> :crypto.hash(account_id)
      |> Base.encode16(case: :lower)
      |> String.slice(0..20)

    "enr_" <> hash
  end

  @spec get_name(number) :: binary
  defp get_name(numeric_token) do
    Enum.at(Account.names(), rem(numeric_token, Enum.count(Account.names())))
  end

  @spec get_account_number(integer) :: binary
  defp get_account_number(numeric_token) do
    token = numeric_token |> Integer.to_string()
    length = String.length(token)
    to_add = String.slice(token, 1..(12 - length))
    token <> to_add
  end

  @spec get_ach(integer) :: binary
  defp get_ach(numeric_token) do
    token = numeric_token |> :erlang.phash2() |> Integer.to_string()
    length = String.length(token)
    to_add = String.slice(token, 1..(9 - length))
    token <> to_add
  end

  @spec get_last_four(integer) :: binary
  defp get_last_four(numeric_token) do
    numeric_token
    |> get_account_number()
    |> String.slice(8..11)
  end

  @spec get_institution(number) :: any
  defp get_institution(numeric_token) do
    institution =
      Enum.at(Account.institutions(), rem(numeric_token, Enum.count(Account.institutions())))

    %{id: institution |> String.replace(" ", "") |> Macro.underscore(), name: institution}
  end
end
