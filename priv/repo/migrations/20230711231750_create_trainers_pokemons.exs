defmodule KogniChallenge.Repo.Migrations.CreateTrainersPokemons do
  use Ecto.Migration

  def change do
    create table(:trainers_pokemons) do
      add :shiny, :boolean, default: false, null: false
      add :catched, :boolean, default: false, null: false
      add :trainer_id, references(:trainers, on_delete: :nothing)
      add :pokemon_id, references(:pokemons, on_delete: :nothing)

      timestamps()
    end

    create index(:trainers_pokemons, [:trainer_id])
    create index(:trainers_pokemons, [:pokemon_id])
  end
end
