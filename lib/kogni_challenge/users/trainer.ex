defmodule KogniChallenge.Users.Trainer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trainers" do
    field :name, :string
    field :sub, :string
    field :email, :string
    field :picture, :string
    field :credential, :string

    many_to_many :pokemons, KogniChallenge.Monsters.Pokemon, join_through: "trainers_pokemons"

    timestamps()
  end

  @doc false
  def changeset(trainer, attrs) do
    trainer
    |> cast(attrs, [:email, :name, :picture, :sub, :credential])
    |> validate_required([:email, :name, :picture, :sub, :credential])
    |> unique_constraint(:email)
  end
end
