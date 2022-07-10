defmodule Sandbox.Transactions do
  @moduledoc """
  Context for transactions
  """
  alias Phoenix.PubSub
  alias Sandbox.MyDateTime
  alias Sandbox.Transactions.Balances
  alias Sandbox.Transactions.Transaction
  alias Sandbox.Utils

  @doc """
  List all transactions. Transactions are calculated from the end of the yeary to 90 days before today.

  So transactions are consistent within a year, it starts calculating transactions from a start balance and adds
  from 0 to 5 transactions per day.

  Transactions are calculated as an Integer and divided by 100 so we don't have the problem of Float calculations.

  Every transactions is calculated using  :erlang.phash2(), which hashses any string and returns an Integer.

  Transactions could be filtered using using from_id and count from id will show the next transaction after that id
  and it will return the number of transactions by count.

  """
  @spec list_transactions(map, binary) :: {:ok, [%Sandbox.Transactions.Transaction{}]} | :error
  def list_transactions(conn, id) do
    if id in conn.assigns.accounts do
      PubSub.broadcast(Sandbox.PubSub, "sandbox_chart", %{account: %{id: id}})

      {:ok,
       Enum.map(get_transactions(id), fn y ->
         numeric_token = :erlang.phash2(y.day)

         %Transaction{
           account_id: id,
           amount: (y.transaction / 100) |> Float.to_string(),
           date: y.date,
           description: get_description(numeric_token),
           details: get_details(numeric_token),
           id: get_id(y.date),
           links: Utils.get_links(conn, id, :transactions),
           running_balance: (y.balance / 100) |> Float.to_string()
         }
       end)
       |> filter_from_today()}
    else
      :error
    end
  end

  @spec filter_transactions(map, binary, number | nil, binary | nil) ::
          {:ok, [%Sandbox.Transactions.Transaction{}]} | :error | {:error, binary}
  def filter_transactions(conn, id, from_id, count) do
    if id in conn.assigns.accounts do
      filtered_transactions =
        Enum.map(get_transactions(id), fn y ->
          numeric_token = :erlang.phash2(y.day)

          %Transaction{
            account_id: id,
            amount: (y.transaction / 100) |> Float.to_string(),
            date: y.date,
            description: get_description(numeric_token),
            details: get_details(numeric_token),
            id: get_id(y.date),
            links: Utils.get_links(conn, id, :transactions),
            running_balance: (y.balance / 100) |> Float.to_string()
          }
        end)
        |> filter_from_today()

      case filter_from_id_count(filtered_transactions, from_id, count) do
        {:ok, response} ->
          PubSub.broadcast(Sandbox.PubSub, "sandbox_chart", %{account: %{id: id}})

          {:ok, response}

        {:error, error} ->
          {:error, error}
      end
    else
      :error
    end
  end

  @doc """
  Returns a transaciont by ID
  """
  @spec get_transaction(Plug.Conn.t(), binary, binary) ::
          :error | {:ok, %Sandbox.Transactions.Transaction{}}
  def get_transaction(conn, account_id, transaction_id) do
    with {:ok, transaction} <- list_transactions(conn, account_id),
         [transaction | _] <- Enum.filter(transaction, &(&1.id == transaction_id)) do
      {:ok, transaction}
    else
      _ -> :error
    end
  end

  @doc """
  Gets accounts balance
  """
  @spec get_balance(map, binary) :: {:ok, %Sandbox.Transactions.Balances{}} | :error
  def get_balance(conn, id) do
    if id in conn.assigns.accounts do
      with {:ok, transactions} <- list_transactions(conn, id) do
        transaction = List.last(transactions)

        {:ok,
         %Balances{
           account_id: id,
           available: transaction.running_balance,
           ledger: transaction.running_balance,
           links: Utils.get_links(conn, id, :balances)
         }}
      end
    else
      :error
    end
  end

  @spec filter_from_id_count(list, binary, integer) :: {:ok, list} | {:error, binary}
  defp filter_from_id_count(list, from_id, count) do
    position =
      Enum.with_index(list)
      |> Enum.filter(fn {transaction, _index} -> transaction.id == from_id end)
      |> List.last()
      |> elem(1)

    {:ok, Enum.slice(list, (position - String.to_integer(count))..(position - 1))}
  rescue
    _ -> {:error, "Wrong parameters"}
  end

  @spec filter_from_today(list) :: list
  defp filter_from_today(list) do
    Enum.reject(list, fn translation ->
      DateTime.compare(translation.date, MyDateTime.utc_now()) == :gt
    end)
  end

  @spec get_transactions(binary) :: [map]
  defp get_transactions(account_id) do
    days = get_days_period()

    Enum.reduce(
      1..(days - 1),
      [
        %{
          balance: get_balance_last_day(account_id),
          date: last_date_year(),
          transaction: 0,
          day: 0
        }
      ],
      fn x, acc -> get_transactions_per_day(x, List.first(acc)) ++ acc end
    )
  end

  @spec get_details(non_neg_integer) :: map
  defp get_details(token) do
    name = get_description(token) |> String.replace("-", " ") |> String.upcase()
    %{category: get_category(token), counterparty: %{name: name, type: "organization"}}
  end

  defp get_id(number) do
    number = number |> DateTime.to_string()

    hash =
      :md5
      |> :crypto.hash(number)
      |> Base.encode16(case: :lower)
      |> String.slice(0..20)

    "txn_" <> hash
  end

  defp get_days_period do
    from = DateTime.add(MyDateTime.utc_now(), -90 * 24 * 3600)
    to = last_date_year()
    (DateTime.diff(to, from, :second) / (3600 * 24)) |> trunc()
  end

  defp last_date_year do
    date = Date.utc_today()
    DateTime.new!(Date.new!(date.year, 12, 31), Time.new!(0, 0, 0))
  end

  defp get_transactions_per_day(number, acc) do
    number_transactions = get_number_transactions_per_day(number)

    date =
      acc.date
      |> DateTime.add(-24 * 3600, :second)
      |> DateTime.to_date()
      |> DateTime.new!(Time.new!(number_transactions + 10, 0, 0, 0))

    list =
      Enum.reduce(0..number_transactions, [acc], fn x, acc ->
        [
          %{
            day: number,
            balance: List.first(acc).balance + get_transaction_amount(:erlang.phash2(x + number)),
            date: DateTime.add(date, -x * 3555, :second),
            transaction: get_transaction_amount(:erlang.phash2(x + number))
          }
          | acc
        ]
      end)

    list |> Enum.reverse() |> tl() |> Enum.reverse()
  end

  defp get_number_transactions_per_day(number) do
    rem(number * 11, 4)
  end

  defp get_transaction_amount(number) do
    number
    |> Integer.to_string()
    |> :erlang.phash2()
    |> Integer.to_string()
    |> String.slice(0..3)
    |> String.to_integer()
  end

  defp get_balance_last_day(account_id) do
    :erlang.phash2(account_id)
    |> Integer.to_string()
    |> String.slice(0..4)
    |> String.to_integer()
  end

  defp get_description(token) do
    Enum.at(Transaction.merchants(), rem(token, Enum.count(Transaction.merchants())))
  end

  defp get_category(token) do
    Enum.at(Transaction.categories(), rem(token, Enum.count(Transaction.categories())))
  end
end
