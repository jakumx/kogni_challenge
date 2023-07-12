defmodule KogniChallengeWeb.PokemonController do
  alias KogniChallenge.Mids
  alias KogniChallenge.Monsters
  alias KogniChallenge.Users
  use KogniChallengeWeb, :controller


  def catch_pokemon(conn, %{"user" => user_sub, "pokemon" => poke_id, "shiny" => shiny}) do
    trainer = Users.find_trainer_by_sub(user_sub)

    pokemon = Monsters.get_pokemon!(poke_id)

    exist_in_box = Mids.find_in_box(pokemon.id, trainer.id)
    if length(exist_in_box) == 0 do
      Mids.create_trainer_pokemon(%{
        trainer_id: trainer.id,
        pokemon_id: pokemon.id,
        shiny: shiny,
        catched: true
      })
      json(conn, %{
        trainer: trainer.id,
        pokemon_id: pokemon.id,
        shiny: shiny,
        catched: true
      })
    else
      [trainer_pokemon] = exist_in_box
      json(conn, %{
        trainer: trainer_pokemon.trainer_id,
        pokemon_id: trainer_pokemon.pokemon_id,
        shiny: trainer_pokemon.shiny,
        catched: trainer_pokemon.catched
      })
    end
  end

  def show_box(conn, %{"user" => user_sub}) do
    trainer = Users.find_trainer_by_sub(user_sub)

    box = Mids.find_all_by_trainer(trainer.id)
    |> Enum.map(fn trainer_pokemon ->
      pokemon = Monsters.get_pokemon!(trainer_pokemon.pokemon_id)
      %{
        name: pokemon.name,
        types: pokemon.types,
        images: pokemon.images,
        pokemon_id: pokemon.pokemon_id,
        shiny: trainer_pokemon.shiny,
        catched: trainer_pokemon.catched

      }
    end)

    json(conn, %{list: box})
  end
end
