defmodule Sandbox.Fixtures.AccountFixtures do
  @moduledoc false
  def account_fixture do
    %{
      "currency" => "USD",
      "enrollment_id" => "enr_1c6da204997bb84636d94",
      "id" => "acc_cf96bce69f409820e4b6b",
      "institution" => %{"id" => "capital_one", "name" => "Capital One"},
      "last_four" => "7399",
      "links" => %{
        "balances" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b/balances",
        "details" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b/details",
        "self" => "http://www.example.com:80/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b",
        "transactions" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b/transactions"
      },
      "name" => "George H. W. Bush",
      "subtype" => "checking",
      "type" => "depository"
    }
  end

  def account_detail_fixture do
    %{
      "account_id" => "acc_cf96bce69f409820e4b6b",
      "account_number" => "573998997399",
      "links" => %{
        "account" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b",
        "self" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_cf96bce69f409820e4b6b/details"
      },
      "routing_numbers" => %{"ach" => "670256317"}
    }
  end
end
