defmodule KogniChallenge.MidsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KogniChallenge.Mids` context.
  """

  @doc """
  Generate a trainer_pokemon.
  """
  def trainer_pokemon_fixture(attrs \\ %{}) do
    {:ok, trainer_pokemon} =
      attrs
      |> Enum.into(%{
        shiny: true,
        catched: true
      })
      |> KogniChallenge.Mids.create_trainer_pokemon()

    trainer_pokemon
  end
end
