defmodule SandboxWeb.Controllers.AccountTest do
  use SandboxWeb.ConnCase

  alias Sandbox.Fixtures.AccountFixtures

  doctest Sandbox

  setup do
    account = AccountFixtures.account_fixture()
    account_detail = AccountFixtures.account_detail_fixture()

    {:ok,
     %{
       account: account,
       account_detail: account_detail
     }}
  end

  test "check list account response", %{conn: conn, account: account} do
    json =
      conn
      |> put_req_header("authorization", "Basic " <> "dGVzdF9ob2xhOg==")
      |> put_req_header("content-type", "application/json")
      |> get("/teller_sandbox/accounts")
      |> json_response(200)
      |> List.first()

    assert json == account
  end

  test "wrong_token_format", %{conn: conn} do
    conn
    |> put_req_header("authorization", "Basic " <> "aa==")
    |> put_req_header("content-type", "application/json")
    |> get("/teller_sandbox/accounts")
    |> response(401)
  end

  test "check get account response", %{conn: conn, account: account} do
    json =
      conn
      |> put_req_header("authorization", "Basic " <> "dGVzdF9ob2xhOg==")
      |> put_req_header("content-type", "application/json")
      |> get("/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b")
      |> json_response(200)

    assert json == account
  end

  test "check get wrong account response", %{conn: conn} do
    conn
    |> put_req_header("authorization", "Basic " <> "dGVzdF9ob2xhOg==")
    |> put_req_header("content-type", "application/json")
    |> get("/teller_sandbox/accounts/bad")
    |> response(404)
  end

  test "check get account detail response", %{conn: conn, account_detail: account_detail} do
    json =
      conn
      |> put_req_header("authorization", "Basic " <> "dGVzdF9ob2xhOg==")
      |> put_req_header("content-type", "application/json")
      |> get("/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b/details")
      |> json_response(200)

    assert json == account_detail
  end

  test "check get wrong account detail response", %{conn: conn} do
    conn
    |> put_req_header("authorization", "Basic " <> "dGVzdF9ob2xhOg==")
    |> put_req_header("content-type", "application/json")
    |> get("/teller_sandbox/accounts/wrong/details")
    |> response(404)
  end
end
