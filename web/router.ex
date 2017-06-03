defmodule FourElixir.Router do
  use FourElixir.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FourElixir do
    pipe_through :browser # Use the default browser stack

    get "/", ProblemController, :index
    resources("problems", ProblemController)
  end
end
