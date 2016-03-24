require "kemal"

def fib(n)
  case n
    when 0 then 0
    when 1 then 1
    else fib(n - 1) + fib(n - 2)
  end
end

get "/:number" do |env|
  fib env.params.url["number"].to_i
end

Kemal.config.port = 4000
Kemal.config.logging = false
Kemal.run
