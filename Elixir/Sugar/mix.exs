defmodule Fibaas.Mixfile do
  use Mix.Project

  def project do
    [app: :fibaas,
     version: "0.1.0",
     elixir: "~> 1.0",
     elixirc_paths: ["lib"],
     compilers: [:sugar] ++ Mix.compilers,
     build_embedded: false,
     start_permanent: false,
     deps: deps]
  end

  def application do
    [mod: {Fibaas, []},
     applications: [:sugar, :cowboy]]
  end

  defp deps do
    [{:sugar, "~> 0.4.9"},
     {:cowboy, "~> 1.0"}]
  end
end
