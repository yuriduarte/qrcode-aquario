defmodule Aquario.Repo.Migrations.AddSpeciesTanksTable do
  use Ecto.Migration

  def change do
    create table(:species_tanks, primary_key: false) do
      add :tank_id, references("tanks"), null: false
      add :specy_id, references("species"), null: false
    end
  end
end
