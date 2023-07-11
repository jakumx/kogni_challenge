defmodule KogniChallenge.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `KogniChallenge.Users` context.
  """

  @doc """
  Generate a unique trainer email.
  """
  def unique_trainer_email, do: "some email#{System.unique_integer([:positive])}"

  @doc """
  Generate a trainer.
  """
  def trainer_fixture(attrs \\ %{}) do
    {:ok, trainer} =
      attrs
      |> Enum.into(%{
        name: "some name",
        sub: "some sub",
        email: unique_trainer_email(),
        picture: "some picture",
        credential: "some credential"
      })
      |> KogniChallenge.Users.create_trainer()

    trainer
  end
end
