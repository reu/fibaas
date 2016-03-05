# Fibaas

## Installation

    $ mix deps.get

## Build

    $ MIX_ENV=prod mix compile.protocols

## Running

    $ MIX_ENV=prod elixir -pa _build/prod/consolidated -S mix phoenix.server
