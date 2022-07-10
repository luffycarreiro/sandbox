defmodule SandboxWeb.Router do
  @moduledoc false

  use SandboxWeb, :router

  import SandboxWeb.AuthController
  import SandboxWeb.ChartLive

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {SandboxWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :get_accounts_from_auth_token
  end

  scope "/", SandboxWeb do
    pipe_through :browser

    get "/docs", DocsController, :index
    live "/", ChartLive
  end

  scope "/teller_sandbox", SandboxWeb do
    pipe_through :api

    get("/accounts", AccountController, :list)
    get("/accounts/:account_id", AccountController, :get)
    get("/accounts/:account_id/details", AccountController, :detail)
    get("/accounts/:account_id/balances", TransactionController, :balances)
    get("/accounts/:account_id/transactions", TransactionController, :list)
    get("/accounts/:account_id/transactions/:transaction_id", TransactionController, :get)
  end

  # Other scopes may use custom stacks.
  # scope "/api", SandboxWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SandboxWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
