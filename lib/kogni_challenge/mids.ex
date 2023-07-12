defmodule KogniChallenge.Mids do
  @moduledoc """
  The Mids context.
  """

  import Ecto.Query, warn: false
  alias KogniChallenge.Repo

  alias KogniChallenge.Mids.TrainerPokemon

  @doc """
  Returns the list of trainers_pokemons.

  ## Examples

      iex> list_trainers_pokemons()
      [%TrainerPokemon{}, ...]

  """
  def list_trainers_pokemons do
    Repo.all(TrainerPokemon)
  end

  @doc """
  Gets a single trainer_pokemon.

  Raises `Ecto.NoResultsError` if the Trainer pokemon does not exist.

  ## Examples

      iex> get_trainer_pokemon!(123)
      %TrainerPokemon{}

      iex> get_trainer_pokemon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trainer_pokemon!(id), do: Repo.get!(TrainerPokemon, id)

  @doc """
  Creates a trainer_pokemon.

  ## Examples

      iex> create_trainer_pokemon(%{field: value})
      {:ok, %TrainerPokemon{}}

      iex> create_trainer_pokemon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trainer_pokemon(attrs \\ %{}) do
    %TrainerPokemon{}
    |> TrainerPokemon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trainer_pokemon.

  ## Examples

      iex> update_trainer_pokemon(trainer_pokemon, %{field: new_value})
      {:ok, %TrainerPokemon{}}

      iex> update_trainer_pokemon(trainer_pokemon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trainer_pokemon(%TrainerPokemon{} = trainer_pokemon, attrs) do
    trainer_pokemon
    |> TrainerPokemon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trainer_pokemon.

  ## Examples

      iex> delete_trainer_pokemon(trainer_pokemon)
      {:ok, %TrainerPokemon{}}

      iex> delete_trainer_pokemon(trainer_pokemon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trainer_pokemon(%TrainerPokemon{} = trainer_pokemon) do
    Repo.delete(trainer_pokemon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trainer_pokemon changes.

  ## Examples

      iex> change_trainer_pokemon(trainer_pokemon)
      %Ecto.Changeset{data: %TrainerPokemon{}}

  """
  def change_trainer_pokemon(%TrainerPokemon{} = trainer_pokemon, attrs \\ %{}) do
    TrainerPokemon.changeset(trainer_pokemon, attrs)
  end

  def find_in_box(pokemon_id, trainer_id) do
    found = from tp in TrainerPokemon,
      where: tp.pokemon_id == ^pokemon_id and tp.trainer_id == ^trainer_id
    Repo.all(found)
  end

  def find_all_by_trainer(trainer_id) do
    found = from tp in TrainerPokemon,
      where: tp.trainer_id == ^trainer_id
    Repo.all(found)
  end
end
