defmodule Sandbox.Fixtures.TransactionFixtures do
  @moduledoc false
  def transaction_fixture do
    %{
      "account_id" => "acc_ea0ceeea5d8079258a1c2",
      "amount" => "29.04",
      "date" => "2022-04-10T10:02:15.000000Z",
      "description" => "Starbucks",
      "details" => %{
        "category" => "advertising",
        "counterparty" => %{"name" => "STARBUCKS", "type" => "organization"}
      },
      "id" => "txn_4bc35baebaeb8e6344b96",
      "links" => %{
        "account" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2",
        "self" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions"
      },
      "running_balance" => "30319.54",
      "status" => "posted",
      "type" => "ach"
    }
  end

  def balances_fixture do
    %{
      "account_id" => "acc_ea0ceeea5d8079258a1c2",
      "available" => "21088.42",
      "ledger" => "21088.42",
      "links" => %{
        "account" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2",
        "self" =>
          "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/balances"
      }
    }
  end

  def transactions_with_params_fixture do
    [
      %{
        "account_id" => "acc_ea0ceeea5d8079258a1c2",
        "amount" => "42.8",
        "date" => "2022-04-11T10:00:00.000000Z",
        "description" => "Foot Locker",
        "details" => %{
          "category" => "groceries",
          "counterparty" => %{"name" => "FOOT LOCKER", "type" => "organization"}
        },
        "id" => "txn_700ec62948896dfa98c7a",
        "links" => %{
          "account" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2",
          "self" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions"
        },
        "running_balance" => "30193.82",
        "status" => "posted",
        "type" => "ach"
      },
      %{
        "account_id" => "acc_ea0ceeea5d8079258a1c2",
        "amount" => "42.8",
        "date" => "2022-04-12T10:00:45.000000Z",
        "description" => "Domino's Pizza",
        "details" => %{
          "category" => "income",
          "counterparty" => %{"name" => "DOMINO'S PIZZA", "type" => "organization"}
        },
        "id" => "txn_4c852759cd665a0a1b8b0",
        "links" => %{
          "account" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2",
          "self" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions"
        },
        "running_balance" => "30151.02",
        "status" => "posted",
        "type" => "ach"
      },
      %{
        "account_id" => "acc_ea0ceeea5d8079258a1c2",
        "amount" => "59.53",
        "date" => "2022-04-12T11:00:00.000000Z",
        "description" => "Domino's Pizza",
        "details" => %{
          "category" => "income",
          "counterparty" => %{"name" => "DOMINO'S PIZZA", "type" => "organization"}
        },
        "id" => "txn_89ad3c68760f4575a0b23",
        "links" => %{
          "account" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2",
          "self" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions"
        },
        "running_balance" => "30108.22",
        "status" => "posted",
        "type" => "ach"
      },
      %{
        "account_id" => "acc_ea0ceeea5d8079258a1c2",
        "amount" => "42.8",
        "date" => "2022-04-13T10:01:30.000000Z",
        "description" => "Burger King",
        "details" => %{
          "category" => "utilities",
          "counterparty" => %{"name" => "BURGER KING", "type" => "organization"}
        },
        "id" => "txn_3ccdf61ac5f3d1990f81c",
        "links" => %{
          "account" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2",
          "self" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions"
        },
        "running_balance" => "30048.69",
        "status" => "posted",
        "type" => "ach"
      },
      %{
        "account_id" => "acc_ea0ceeea5d8079258a1c2",
        "amount" => "59.53",
        "date" => "2022-04-13T11:00:45.000000Z",
        "description" => "Burger King",
        "details" => %{
          "category" => "utilities",
          "counterparty" => %{"name" => "BURGER KING", "type" => "organization"}
        },
        "id" => "txn_9adf48e28191a611ad8f2",
        "links" => %{
          "account" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2",
          "self" =>
            "http://www.example.com:80/teller_sandbox/accounts/acc_ea0ceeea5d8079258a1c2/transactions"
        },
        "running_balance" => "30005.89",
        "status" => "posted",
        "type" => "ach"
      }
    ]
  end
end
