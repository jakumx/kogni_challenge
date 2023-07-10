defmodule KogniChallenge.Repo do
  use Ecto.Repo,
    otp_app: :kogni_challenge,
    adapter: Ecto.Adapters.Postgres
end
