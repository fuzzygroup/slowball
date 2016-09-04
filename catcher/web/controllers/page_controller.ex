defmodule Catcher.PageController do
  use Catcher.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
