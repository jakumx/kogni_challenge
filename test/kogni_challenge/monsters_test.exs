defmodule KogniChallenge.MonstersTest do
  use KogniChallenge.DataCase

  alias KogniChallenge.Monsters

  describe "pokemons" do
    alias KogniChallenge.Monsters.Pokemon

    import KogniChallenge.MonstersFixtures

    @invalid_attrs %{name: nil, types: nil, pokemon_id: nil, images: nil}

    test "list_pokemons/0 returns all pokemons" do
      pokemon = pokemon_fixture()
      assert Monsters.list_pokemons() == [pokemon]
    end

    test "get_pokemon!/1 returns the pokemon with given id" do
      pokemon = pokemon_fixture()
      assert Monsters.get_pokemon!(pokemon.id) == pokemon
    end

    test "create_pokemon/1 with valid data creates a pokemon" do
      valid_attrs = %{name: "some name", types: ["option1", "option2"], pokemon_id: 42, images: ["option1", "option2"]}

      assert {:ok, %Pokemon{} = pokemon} = Monsters.create_pokemon(valid_attrs)
      assert pokemon.name == "some name"
      assert pokemon.types == ["option1", "option2"]
      assert pokemon.pokemon_id == 42
      assert pokemon.images == ["option1", "option2"]
    end

    test "create_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Monsters.create_pokemon(@invalid_attrs)
    end

    test "update_pokemon/2 with valid data updates the pokemon" do
      pokemon = pokemon_fixture()
      update_attrs = %{name: "some updated name", types: ["option1"], pokemon_id: 43, images: ["option1"]}

      assert {:ok, %Pokemon{} = pokemon} = Monsters.update_pokemon(pokemon, update_attrs)
      assert pokemon.name == "some updated name"
      assert pokemon.types == ["option1"]
      assert pokemon.pokemon_id == 43
      assert pokemon.images == ["option1"]
    end

    test "update_pokemon/2 with invalid data returns error changeset" do
      pokemon = pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = Monsters.update_pokemon(pokemon, @invalid_attrs)
      assert pokemon == Monsters.get_pokemon!(pokemon.id)
    end

    test "delete_pokemon/1 deletes the pokemon" do
      pokemon = pokemon_fixture()
      assert {:ok, %Pokemon{}} = Monsters.delete_pokemon(pokemon)
      assert_raise Ecto.NoResultsError, fn -> Monsters.get_pokemon!(pokemon.id) end
    end

    test "change_pokemon/1 returns a pokemon changeset" do
      pokemon = pokemon_fixture()
      assert %Ecto.Changeset{} = Monsters.change_pokemon(pokemon)
    end
  end
end
