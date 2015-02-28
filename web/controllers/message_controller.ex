defmodule LinkExtractorWeb.MessageController do
  use Phoenix.Controller

  plug :action

  def create(conn, _params) do
    {:ok, message, conn} = Plug.Conn.read_body(conn)
    IO.inspect message
    LinkExtractor.inject(message)
    IO.inspect LinkExtractor.get_links
    send_resp conn, 200, ""
  end
end
