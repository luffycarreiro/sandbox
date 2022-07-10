defmodule Sandbox.Accounts.AccountDetail do
  @moduledoc false
  use Ecto.Schema

  @primary_key false
  embedded_schema do
    field :account_id, :string
    field :account_number, :integer
    field :links, :map
    field :routing_numbers, :map
  end

  defimpl Jason.Encoder, for: __MODULE__ do
    def encode(struct, opts) do
      struct
      |> Map.take(struct.__struct__.__schema__(:fields))
      |> Jason.Encode.map(opts)
    end
  end
end
