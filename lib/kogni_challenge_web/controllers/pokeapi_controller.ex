defmodule KogniChallengeWeb.PokeapiController do
  alias KogniChallenge.Monsters
  use KogniChallengeWeb, :controller


  def index(conn, _params) do
    list_pokemon = #Enum.take_random(1..1010, 12)
    [16, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
    |> Enum.map(fn pokemon -> find_pokemon_in_db(pokemon) end)
    |> Enum.map(fn tuple_pokemon -> call_pokemon(tuple_pokemon) end)
    |> Enum.map(fn monster -> set_response(monster) end)

    json(conn, list_pokemon)
  end

  def pokeapi_api() do
    Application.get_env(:kogni_challenge, :pokeapi_api)
  end

  def set_shiny(shiny_img) do
    shiny_img != nil && (Enum.take_random(1..15, 1) |> Enum.at(0) == 1)
  end

  def find_pokemon_in_db(pokemon_id) do
    monster = Monsters.get_official_pokemon(pokemon_id)
    if (!monster) do
      {:error, monster: %{pokemon_id: pokemon_id}}
    else
      {:ok, monster: monster}
    end
  end

  def call_pokemon(t_pokemon) do
    case t_pokemon do
      {:ok, pokemon} ->
        pokemon
      {:error, [{:monster, monster}]} ->
        {:ok, pokemon } = pokeapi_api().request_pokemon(monster.pokemon_id)
        |> Monsters.create_pokemon()
        [{:monster, pokemon}]
    end
  end

  def set_response(monster) do
    [{:monster, pokemon}] = monster
    %{
      pokemon_id: pokemon.id,
      name: pokemon.name,
      images: pokemon.images,
      types: pokemon.types,
      shiny: set_shiny(Enum.at(pokemon.types, 1))
    }
  end

  @spec request_pokemon(any) :: %{images: list, name: any, pokemon_id: any, types: list}
  def request_pokemon(id) do
    case HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{id}/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        decoded = Poison.decode!(body)
        %{
          pokemon_id: id,
          name: decoded["name"],
          images: [decoded["sprites"]["other"]["official-artwork"]["front_default"],
                  decoded["sprites"]["other"]["official-artwork"]["front_shiny"]],
          types: Enum.map(decoded["types"], fn t -> t["type"]["name"] end),
          # shiny: set_shiny(decoded["sprites"]["other"]["official-artwork"]["front_shiny"])
        }
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
        %{
          pokemon_id: nil,
          name: nil,
          images: [],
          types: []
        }
    end
  end
end
