defmodule KogniChallengeWeb.PokeapiController do
  use KogniChallengeWeb, :controller


  def index(conn, _params) do
    list_pokemon = Enum.take_random(1..1010, 12)
    |> Enum.map(fn pokemon -> pokeapi_api().request_pokemon(pokemon) end)

    json(conn, list_pokemon)
  end

  def pokeapi_api() do
    Application.get_env(:kogni_challenge, :pokeapi_api)
  end

  def request_pokemon(id) do
    case HTTPoison.get("https://pokeapi.co/api/v2/pokemon/#{id}/") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        decoded = Poison.decode!(body)
        %{
          id: id,
          name: decoded["name"],
          image: decoded["sprites"]["other"]["official-artwork"],
          types: Enum.map(decoded["types"], fn t -> t["type"]["name"] end)
        }
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
        %{
          id: nil,
          name: nil,
          image: nil,
          types: []
        }
    end
  end
end
