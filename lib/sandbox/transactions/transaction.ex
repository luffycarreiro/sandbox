defmodule Sandbox.Transactions.Transaction do
  @moduledoc false
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :account_id, :string
    field :amount, :decimal
    field :date, :utc_datetime
    field :description, :string
    field :details, :map
    field :id, :string
    field :links, :map
    field :running_balance, :decimal
    field :status, :string, default: "posted"
    field :type, :string, default: "ach"
  end

  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(struct, opts) do
      struct
      |> Map.take(struct.__struct__.__schema__(:fields))
      |> Jason.Encode.map(opts)
    end
  end

  @spec merchants :: list
  def merchants do
    [
      "Hotel Tonight",
      "Misson Ceviche",
      "The  Caltrain",
      "Wingstop",
      "Slim Chickens",
      "CVS",
      "Duane Reade",
      "Walgreens",
      "Ro",
      "McDonald's",
      "Burger King",
      "KFC",
      "Popeye's",
      "Shake Shack",
      "Lowe's",
      "The H",
      "Costco",
      "Kroger",
      "iTunes",
      "Spotify",
      "Best Buy",
      "TJ Maxx",
      "Aldi",
      "Dollar",
      "Macy's",
      "H.E. Butt",
      "Dollar Tree",
      "Verizon Wireless",
      "Sprint PCS",
      "T-Mobi",
      "Starbucks",
      "7-Eleven",
      "AT&T Wireless",
      "Rite Aid",
      "Nordstrom",
      "Ross",
      "Gap",
      "Bed, Bath & Beyond",
      "J.C. Penney",
      "Subway",
      "O'Reilly",
      "Wendy's",
      "Dunkin",
      "Petsmart",
      "Dick's Sporting Goods",
      "Sears",
      "Staples",
      "Domino's Pizza",
      "Piz",
      "Papa John's",
      "IKEA",
      "Office Depot",
      "Foot Locker",
      "Lids",
      "GameStop",
      "Seph",
      "Panera",
      "Williams-Sonoma",
      "Saks Fifth Avenue",
      "Chipotle Mexican Grill",
      "Ex",
      "Neiman Marcus",
      "Jack In The Box",
      "Sonic",
      "Shell"
    ]
  end

  @spec categories :: list
  def categories do
    [
      "accommodation",
      "advertising",
      "bar",
      "charity",
      "clothing",
      "dining",
      "educat",
      "entertainment",
      "fuel",
      "groceries",
      "health",
      "home",
      "income",
      "insurance",
      "office",
      "phone",
      "service",
      "shopping",
      "software",
      "sport",
      "tax",
      "transpor",
      "utilities"
    ]
  end
end
