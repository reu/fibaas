require "bundler"
Bundler.require

class Fibonacci < NYNY::Base
  helpers do
    def fib(n)
      case n
        when 0 then 0
        when 1 then 1
        else fib(n - 1) + fib(n - 2)
      end
    end
  end

  get "/:number" do
    fib(params[:number].to_i).to_s
  end
end

Rack::Handler::Puma.run Fibonacci.new,
  Port: 4000,
  Environment: "production",
  Threads: "4:16"
