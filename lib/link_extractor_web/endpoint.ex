defmodule LinkExtractorWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :link_extractor_web

  # Serve at "/" the given assets from "priv/static" directory
  plug Plug.Static,
    at: "/", from: :link_extractor_web,
    only: ~w(css images js favicon.ico robots.txt)

  plug Plug.Logger

  # Code reloading will only work if the :code_reloader key of
  # the :phoenix application is set to true in your config file.
  plug Phoenix.CodeReloader

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Poison

  plug Plug.MethodOverride
  plug Plug.Head

  plug Plug.Session,
    store: :cookie,
    key: "_link_extractor_web_key",
    signing_salt: "fi37XeQB",
    encryption_salt: "ZVzW2EhZ"

  plug :router, LinkExtractorWeb.Router
end
