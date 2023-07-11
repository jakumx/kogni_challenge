defmodule KogniChallenge.Monsters.Pokemon do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pokemons" do
    field :name, :string
    field :types, {:array, :string}
    field :pokemon_id, :integer
    field :images, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(pokemon, attrs) do
    pokemon
    |> cast(attrs, [:pokemon_id, :name, :types, :images])
    |> validate_required([:pokemon_id, :name, :types, :images])
    |> unique_constraint(:pokemon_id)
  end
end
