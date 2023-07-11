defmodule KogniChallengeWeb.PokemonApi.InMemory do
  def request_pokemon(_) do
    [%{"id" => 780, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/780.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/780.png"], "name" => "drampa", "types" => ["normal", "dragon"]},
    %{"id" => 483, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/483.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/483.png"], "name" => "dialga", "types" => ["steel", "dragon"]},
    %{"id" => 27, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/27.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/27.png"], "name" => "sandshrew", "types" => ["ground"]},
    %{"id" => 474, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/474.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/474.png"], "name" => "porygon-z", "types" => ["normal"]},
    %{"id" => 473, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/473.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/473.png"], "name" => "mamoswine", "types" => ["ice", "ground"]},
    %{"id" => 91, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/91.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/91.png"], "name" => "cloyster", "types" => ["water", "ice"]},
    %{"id" => 260, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/260.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/260.png"], "name" => "swampert", "types" => ["water", "ground"]},
    %{"id" => 871, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/871.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/871.png"], "name" => "pincurchin", "types" => ["electric"]},
    %{"id" => 54, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/54.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/54.png"], "name" => "psyduck", "types" => ["water"]},
    %{"id" => 683, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/683.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/683.png"], "name" => "aromatisse", "types" => ["fairy"]},
    %{"id" => 432, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/432.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/432.png"], "name" => "purugly", "types" => ["normal"]},
    %{"id" => 588, "images" => ["https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/588.png", "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/588.png"], "name" => "karrablast", "types" => ["bug"]}]
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
