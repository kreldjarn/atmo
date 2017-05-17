defmodule MusicGeocache.Token do
  use MusicGeocache.Web, :controller
  def unauthenticated(conn, _params) do
    conn
    |> put_flash(:info, "You must be signed in to access this resource.")
    |> redirect(to: session_path(conn, :new))
  end

  def unauthorized(conn, _params) do
    conn
    |> put_flash(:error, "You must be signed in to access this resource.")
    |> redirect(to: session_path(conn, :new))
  end
end
