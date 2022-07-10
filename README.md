# Sandbox API

This is an API that returns the balances in an account and transactions depending on the token provided.

Token must be provided as basic Auth filling the name with the following format, password should be left empty.

```
test_<token_id>
```

token_id must be any string with non special chars like

```
_
```

 .

## Endpoints

```
GET /accounts
GET /accounts/:account_id
GET /accounts/:account_id/details
GET /accounts/:account_id/balances
GET /accounts/:account_id/transactions
GET /accounts/:account_id/transactions/:transaction_id
```

## To start your Phoenix server:

* Install dependencies with `mix deps.get`
* in assets directory

  ```
  npm install
  ```
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Or if you have docker just:

```
docker-compose up -d
```

 Inside docker

```
cd assets && npm install
```

## Real time data

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser for getting real time data on endpoint usage.

## Docs

[`localhost:4000/docs/index.html`](http://localhost:4000/docs/index.html)

## Test

mix test
