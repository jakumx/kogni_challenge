defmodule KogniChallenge.MonstersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KogniChallenge.Monsters` context.
  """

  @doc """
  Generate a unique pokemon pokemon_id.
  """
  def unique_pokemon_pokemon_id, do: System.unique_integer([:positive])

  @doc """
  Generate a pokemon.
  """
  def pokemon_fixture(attrs \\ %{}) do
    {:ok, pokemon} =
      attrs
      |> Enum.into(%{
        name: "some name",
        types: ["option1", "option2"],
        pokemon_id: unique_pokemon_pokemon_id(),
        images: ["option1", "option2"]
      })
      |> KogniChallenge.Monsters.create_pokemon()

    pokemon
  end
end
