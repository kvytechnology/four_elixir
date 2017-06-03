defmodule FourElixir.Repo.Migrations.CreateProblem do
  use Ecto.Migration

  def change do
    create table(:problems) do
      add :name, :string
      add :body, :string, size: 25500

      timestamps()
    end

  end
end
