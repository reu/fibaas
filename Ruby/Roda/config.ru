require "bundler"
Bundler.require

class Fibonacci < Roda
  def fib(n)
    case n
      when 0 then 0
      when 1 then 1
      else fib(n - 1) + fib(n - 2)
    end
  end

  route do |r|
    r.is ":number" do |number|
      fib(number.to_i).to_s
    end
  end
end

Rack::Handler::Puma.run Fibonacci.app,
  Port: 4000,
  Environment: "production",
  Threads: "4:16"
