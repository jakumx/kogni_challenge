defmodule KogniChallenge.Repo.Migrations.CreateTrainers do
  use Ecto.Migration

  def change do
    create table(:trainers) do
      add :email, :string
      add :name, :string
      add :picture, :string
      add :sub, :string
      add :credential, :string

      timestamps()
    end

    create unique_index(:trainers, [:email])
  end
end
