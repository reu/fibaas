require "bundler"
Bundler.require

Cuba.define do
  def fib(n)
    case n
      when 0 then 0
      when 1 then 1
      else fib(n - 1) + fib(n - 2)
    end
  end

  on get do
    on ":number" do |number|
      res.write fib(number.to_i).to_s
    end
  end
end

Rack::Handler::Puma.run Cuba,
  Port: 4000,
  Environment: "production",
  Threads: "4:16"
