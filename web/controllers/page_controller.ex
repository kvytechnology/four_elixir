defmodule FourElixir.PageController do
  use FourElixir.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
