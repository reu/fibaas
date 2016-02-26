defmodule Fibaas.Mixfile do
  use Mix.Project

  def project do
    [app: :fibaas,
     version: "0.1.0",
     elixir: "~> 1.0",
     elixirc_paths: ["lib"],
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: false,
     start_permanent: false,
     deps: deps]
  end

  def application do
    [mod: {Fibaas, []},
     applications: [:phoenix, :cowboy, :logger]]
  end

  defp deps do
    [{:phoenix, "~> 1.1.4"},
     {:cowboy, "~> 1.0"}]
  end
end
