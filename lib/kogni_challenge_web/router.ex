defmodule KogniChallengeWeb.Router do
  alias KogniChallengeWeb.LoginController
  alias KogniChallengeWeb.PokeapiController
  alias KogniChallengeWeb.PokemonController
  use KogniChallengeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {KogniChallengeWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]

    get "/pokeapi", PokeapiController, :index
    post "/login", LoginController, :show_create
    post "/catch", PokemonController, :catch_pokemon
    post "/box", PokemonController, :show_box
  end

  scope "/", KogniChallengeWeb do
    pipe_through :browser

    get "/", PageController, :home
  end

  # Other scopes may use custom stacks.
  # scope "/api", KogniChallengeWeb do
  #   pipe_through :api

  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kogni_challenge, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: KogniChallengeWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
