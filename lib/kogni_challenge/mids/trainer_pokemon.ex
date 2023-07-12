defmodule KogniChallenge.Mids.TrainerPokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainers_pokemons" do
    field :shiny, :boolean, default: false
    field :catched, :boolean, default: false
    field :trainer_id, :id
    field :pokemon_id, :id

    timestamps()
  end

  @doc false
  def changeset(trainer_pokemon, attrs) do
    trainer_pokemon
    |> cast(attrs, [:shiny, :catched, :trainer_id, :pokemon_id])
    |> validate_required([:shiny, :catched])
  end
end
