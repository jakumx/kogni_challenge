defmodule KogniChallengeWeb.LoginController do
  use KogniChallengeWeb, :controller

  import Ecto.Query, warn: false
  alias KogniChallenge.Repo
  alias KogniChallenge.Users.Trainer

  def show_create(conn, %{"credential" => credential}) do

    response_credentials = decode_credential(credential)
    trainer_found = Repo.get_by(Trainer, email:  response_credentials["email"])
    if !trainer_found do
      {:ok, found} = %Trainer{
        name: response_credentials["name"],
        sub: response_credentials["sub"],
        email: response_credentials["email"],
        picture: response_credentials["picture"],
      }
      |> Repo.insert
      json(conn, %{
        name: found.name,
        sub: found.sub,
        email: found.email,
        picture: found.picture
      })
    else
      json(conn, %{
        name: trainer_found.name,
        sub: trainer_found.sub,
        email: trainer_found.email,
        picture: trainer_found.picture
      })
    end
  end

  def decode_credential(credential) do
    credential_split = String.split(credential, ".")

    reduced_split_credential = List.delete_at(credential_split, 2)
    _credential_headers = Base.decode64!(List.first(reduced_split_credential), padding: false)
    Base.decode64!(List.last(reduced_split_credential), padding: false)
    |> Poison.decode!
  end
end
