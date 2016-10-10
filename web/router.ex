defmodule Maintain.Router do
  use Maintain.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    # TODO: plug :authenticate_with_token
  end

  scope "/", Maintain do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index

    get "/login", UserController, :login
    post "/login", UserController, :create_session
    delete "/logout", UserController, :delete_session
    resources "/users", UserController, except: [:index]

    resources "/registrations", RegistrationController, only: [:new, :create]

  end

  #scope "/api", Maintain.Api, as: :api do
  #  pipe_through :api

  #  scope "/v1", V1, as: :v1 do
  #  end
  #end
end
