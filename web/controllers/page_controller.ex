defmodule LinkExtractorWeb.PageController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
  
  def show(conn, _params) do
    render conn, "index.html"
  end
end
