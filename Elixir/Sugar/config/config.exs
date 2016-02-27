use Mix.Config

config :sugar, router: Fibaas.Router
config :sugar, Fibaas.Router, http: [port: 4000], https: false
