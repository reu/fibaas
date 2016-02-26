require "bundler"
Bundler.require

class Fibonacci < Sinatra::Base
  def fib(n)
    case n
      when 0 then 0
      when 1 then 1
      else fib(n - 1) + fib(n - 2)
    end
  end

  get "/:number" do
    fib(params[:number].to_i).to_s
  end
end

Rack::Handler::Puma.run Fibonacci,
  Port: 4000,
  Environment: "production",
  Threads: "4:16"
