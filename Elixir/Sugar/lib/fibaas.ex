defmodule Fibaas do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    opts = [strategy: :one_for_one, name: Fibaas.Supervisor]
    Supervisor.start_link([], opts)
  end
end

defmodule Fibaas.Router do
  use Sugar.Router

  get "/:number", Fibaas.Controllers.Fibonacci, :fib
end

defmodule Fibaas.Controllers.Fibonacci do
  use Sugar.Controller

  def fib(0) do 0 end
  def fib(1) do 1 end
  def fib(n) do fib(n - 1) + fib(n - 2) end

  def fib(conn, params) do
    result = fib(String.to_integer(params[:number]))
    raw conn |> resp(200, Integer.to_string(result))
  end
end
