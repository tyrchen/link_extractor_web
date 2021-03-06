defmodule LinkExtractorWeb.Router do
  use Phoenix.Router

  pipeline :browser do
    plug :accepts, ~w(html)
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ~w(json)
  end

  scope "/", LinkExtractorWeb do
    pipe_through :browser # Use the default browser stack

    get "/", LinkController, :index
    get "/links", LinkController, :index
    post "/messages", MessageController, :create
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", LinkExtractorWeb do
  #   pipe_through :api
  # end
end
