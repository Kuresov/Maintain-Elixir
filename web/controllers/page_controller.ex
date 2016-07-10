defmodule Maintain.PageController do
  use Maintain.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
