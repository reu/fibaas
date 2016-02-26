use Mix.Config

config :fibaas, Fibaas.Endpoint,
  url: [host: "localhost"],
  root: Path.dirname(__DIR__),
  http: [port: 4000],
  debug_errors: false,
  code_reloader: false,
  check_origin: false,
  watchers: []

config :logger, backends: []
