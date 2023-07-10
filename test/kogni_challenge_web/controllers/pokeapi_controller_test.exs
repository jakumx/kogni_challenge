defmodule KogniChallengeWeb.PokemonApi.InMemory do
  def request_pokemon(1) do
    IO.inspect "entraaaaa"
    [%{"id" => 85, "image" => %{"front_default" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png", "front_shiny" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/25.png"}, "name" => "pikachu", "types" => ["electric"]}, %{"id" => 564, "image" => %{"front_default" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png", "front_shiny" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/25.png"}, "name" => "pikachu", "types" => ["electric"]}]
  end
end

defmodule KogniChallengeWeb.PokeapiControllerTest do
  use KogniChallengeWeb.ConnCase

  test "GET /pokeapi", %{conn: conn} do
    conn = get(conn, ~p"/pokeapi")

    # [%{"id" => 85, "image" => %{"front_default" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png", "front_shiny" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/25.png"}, "name" => "pikachu", "types" => ["electric"]}, %{"id" => 564, "image" => %{"front_default" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png", "front_shiny" => "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/25.png"}, "name" => "pikachu", "types" => ["electric"]}]
    assert json_response(conn, 200) == %{"id" => "1"}
  end
end
