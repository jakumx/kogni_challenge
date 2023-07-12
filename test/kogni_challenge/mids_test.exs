defmodule KogniChallenge.MidsTest do
  use KogniChallenge.DataCase

  alias KogniChallenge.Mids

  describe "trainers_pokemons" do
    alias KogniChallenge.Mids.TrainerPokemon

    import KogniChallenge.MidsFixtures

    @invalid_attrs %{shiny: nil, catched: nil}

    test "list_trainers_pokemons/0 returns all trainers_pokemons" do
      trainer_pokemon = trainer_pokemon_fixture()
      assert Mids.list_trainers_pokemons() == [trainer_pokemon]
    end

    test "get_trainer_pokemon!/1 returns the trainer_pokemon with given id" do
      trainer_pokemon = trainer_pokemon_fixture()
      assert Mids.get_trainer_pokemon!(trainer_pokemon.id) == trainer_pokemon
    end

    test "create_trainer_pokemon/1 with valid data creates a trainer_pokemon" do
      valid_attrs = %{shiny: true, catched: true}

      assert {:ok, %TrainerPokemon{} = trainer_pokemon} = Mids.create_trainer_pokemon(valid_attrs)
      assert trainer_pokemon.shiny == true
      assert trainer_pokemon.catched == true
    end

    test "create_trainer_pokemon/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Mids.create_trainer_pokemon(@invalid_attrs)
    end

    test "update_trainer_pokemon/2 with valid data updates the trainer_pokemon" do
      trainer_pokemon = trainer_pokemon_fixture()
      update_attrs = %{shiny: false, catched: false}

      assert {:ok, %TrainerPokemon{} = trainer_pokemon} = Mids.update_trainer_pokemon(trainer_pokemon, update_attrs)
      assert trainer_pokemon.shiny == false
      assert trainer_pokemon.catched == false
    end

    test "update_trainer_pokemon/2 with invalid data returns error changeset" do
      trainer_pokemon = trainer_pokemon_fixture()
      assert {:error, %Ecto.Changeset{}} = Mids.update_trainer_pokemon(trainer_pokemon, @invalid_attrs)
      assert trainer_pokemon == Mids.get_trainer_pokemon!(trainer_pokemon.id)
    end

    test "delete_trainer_pokemon/1 deletes the trainer_pokemon" do
      trainer_pokemon = trainer_pokemon_fixture()
      assert {:ok, %TrainerPokemon{}} = Mids.delete_trainer_pokemon(trainer_pokemon)
      assert_raise Ecto.NoResultsError, fn -> Mids.get_trainer_pokemon!(trainer_pokemon.id) end
    end

    test "change_trainer_pokemon/1 returns a trainer_pokemon changeset" do
      trainer_pokemon = trainer_pokemon_fixture()
      assert %Ecto.Changeset{} = Mids.change_trainer_pokemon(trainer_pokemon)
    end
  end
end
