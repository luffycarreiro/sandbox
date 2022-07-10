defmodule Sandbox.Accounts.Account do
  @moduledoc false
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :currency, :string, default: "USD"
    field :enrollment_id, :string
    field :id, :string
    field :institution, :map
    field :last_four, :integer
    field :links, :map
    field :name, :string
    field :subtype, :string, default: "checking"
    field :type, :string, default: "depository"
  end

  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(struct, opts) do
      struct
      |> Map.take(struct.__struct__.__schema__(:fields))
      |> Jason.Encode.map(opts)
    end
  end

  @spec names :: list
  def names do
    [
      "My Checking",
      "Jimmy Carter",
      "Ronald Reagan",
      "George H. W. Bush",
      "Bill Clinton",
      "George W. Bush",
      "Barack Obama",
      "Donald Trump"
    ]
  end

  @spec institutions :: list
  def institutions do
    ["Chase", "Bank of America", "Wells Fargo", "Citibank", "Capital One"]
  end
end
