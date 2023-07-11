defmodule KogniChallenge.UsersTest do
  use KogniChallenge.DataCase

  alias KogniChallenge.Users

  describe "trainers" do
    alias KogniChallenge.Users.Trainer

    import KogniChallenge.UsersFixtures

    @invalid_attrs %{name: nil, sub: nil, email: nil, picture: nil, credential: nil}

    test "list_trainers/0 returns all trainers" do
      trainer = trainer_fixture()
      assert Users.list_trainers() == [trainer]
    end

    test "get_trainer!/1 returns the trainer with given id" do
      trainer = trainer_fixture()
      assert Users.get_trainer!(trainer.id) == trainer
    end

    test "create_trainer/1 with valid data creates a trainer" do
      valid_attrs = %{name: "some name", sub: "some sub", email: "some email", picture: "some picture", credential: "some credential"}

      assert {:ok, %Trainer{} = trainer} = Users.create_trainer(valid_attrs)
      assert trainer.name == "some name"
      assert trainer.sub == "some sub"
      assert trainer.email == "some email"
      assert trainer.picture == "some picture"
      assert trainer.credential == "some credential"
    end

    test "create_trainer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_trainer(@invalid_attrs)
    end

    test "update_trainer/2 with valid data updates the trainer" do
      trainer = trainer_fixture()
      update_attrs = %{name: "some updated name", sub: "some updated sub", email: "some updated email", picture: "some updated picture", credential: "some updated credential"}

      assert {:ok, %Trainer{} = trainer} = Users.update_trainer(trainer, update_attrs)
      assert trainer.name == "some updated name"
      assert trainer.sub == "some updated sub"
      assert trainer.email == "some updated email"
      assert trainer.picture == "some updated picture"
      assert trainer.credential == "some updated credential"
    end

    test "update_trainer/2 with invalid data returns error changeset" do
      trainer = trainer_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_trainer(trainer, @invalid_attrs)
      assert trainer == Users.get_trainer!(trainer.id)
    end

    test "delete_trainer/1 deletes the trainer" do
      trainer = trainer_fixture()
      assert {:ok, %Trainer{}} = Users.delete_trainer(trainer)
      assert_raise Ecto.NoResultsError, fn -> Users.get_trainer!(trainer.id) end
    end

    test "change_trainer/1 returns a trainer changeset" do
      trainer = trainer_fixture()
      assert %Ecto.Changeset{} = Users.change_trainer(trainer)
    end
  end
end
