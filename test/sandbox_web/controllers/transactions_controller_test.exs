defmodule SandboxWeb.Controller.TransactionsTest do
  use SandboxWeb.ConnCase

  import Mock

  alias Sandbox.Fixtures.TransactionFixtures

  doctest Sandbox

  setup do
    transaction = TransactionFixtures.transaction_fixture()
    balances = TransactionFixtures.balances_fixture()
    transactions_with_params = TransactionFixtures.transactions_with_params_fixture()

    {:ok,
     %{
       transaction: transaction,
       balances: balances,
       transactions_with_params: transactions_with_params
     }}
  end

  test "check list transactions response", %{conn: conn, transaction: transaction} do
    with_mocks [
      Sandbox.TimeMock.time_mock()
    ] do
      json =
        conn
        |> put_req_header("authorization", "Basic " <> "dGVzdF9oZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjo=")
        |> put_req_header("content-type", "application/json")
        |> get("/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions")
        |> json_response(200)
        |> List.first()

      assert json == transaction
    end
  end

  test "transaction wrong token format", %{conn: conn} do
    conn
    |> put_req_header("authorization", "Basic " <> "aa==")
    |> put_req_header("content-type", "application/json")
    |> get("/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions")
    |> response(401)
  end

  test "check get transaction response", %{conn: conn, transaction: transaction} do
    with_mocks [
      Sandbox.TimeMock.time_mock()
    ] do
      json =
        conn
        |> put_req_header("authorization", "Basic " <> "dGVzdF9oZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjo=")
        |> put_req_header("content-type", "application/json")
        |> get(
          "/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions/txn_4bc35baebaeb8e6344b96"
        )
        |> json_response(200)

      assert json == transaction
    end
  end

  test "check get balances", %{conn: conn, balances: balances} do
    with_mocks [
      Sandbox.TimeMock.time_mock()
    ] do
      json =
        conn
        |> put_req_header("authorization", "Basic " <> "dGVzdF9oZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjo=")
        |> put_req_header("content-type", "application/json")
        |> get("/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/balances")
        |> json_response(200)

      assert json == balances
    end
  end

  test "check list transactions response with params", %{
    conn: conn,
    transactions_with_params: transactions_with_params
  } do
    with_mocks [
      Sandbox.TimeMock.time_mock()
    ] do
      json =
        conn
        |> put_req_header("authorization", "Basic " <> "dGVzdF9oZmZmZmZmZmZmZmZmZmZmZmZmZmZmZjo=")
        |> put_req_header("content-type", "application/json")
        |> get(
          "/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions?from_id=txn_79b1f37ece4fe1f4074f8&count=5"
        )
        |> json_response(200)

      assert json == transactions_with_params
    end
  end
end
