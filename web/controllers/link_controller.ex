defmodule LinkExtractorWeb.LinkController do
  use Phoenix.Controller

  plug :action

  def index(conn, _params) do
    links = LinkExtractor.get_links
    render conn, "index.html", links: links
  end
end
