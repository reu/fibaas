defmodule Fibaas do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [supervisor(Fibaas.Endpoint, [])]

    opts = [strategy: :one_for_one, name: Fibaas.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

defmodule Fibaas.FibonacciController do
  use Phoenix.Controller

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n - 1) + fib(n - 2) end

  def fib(conn, %{"number" => number}) do
    text conn, fib(String.to_integer(number))
  end
end

defmodule Fibaas.Router do
  use Phoenix.Router
  get "/:number", Fibaas.FibonacciController, :fib
end

defmodule Fibaas.Endpoint do
  use Phoenix.Endpoint, otp_app: :fibaas
  plug Fibaas.Router
end
