defmodule FourElixir.Problem do
  use FourElixir.Web, :model

  schema "problems" do
    field :name, :string
    field :body, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :body])
    |> validate_required([:name, :body])
  end
end
