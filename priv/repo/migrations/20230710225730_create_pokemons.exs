defmodule KogniChallenge.Repo.Migrations.CreatePokemons do
  use Ecto.Migration

  def change do
    create table(:pokemons) do
      add :pokemon_id, :integer
      add :name, :string
      add :types, {:array, :string}
      add :images, {:array, :string}

      timestamps()
    end

    create unique_index(:pokemons, [:pokemon_id])
  end
end
