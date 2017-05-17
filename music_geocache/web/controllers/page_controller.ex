defmodule MusicGeocache.PageController do
  use MusicGeocache.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
