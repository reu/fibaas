require 'bundler'
Bundler.require

class FibonacciController < Chespirito::Controller
  def fib(n)
    case n
      when 0 then 0
      when 1 then 1
      else fib(n - 1) + fib(n - 2)
    end
  end

  def calculate
    result = fib(request.params['number'].to_i)

    response.body = result.to_s
    response.status = 200
    response.headers['Content-Type'] = 'text/plain'
  end
end

FibonacciApp = Chespirito::App.configure do |app|
  app.register_route('GET', '/:number', [FibonacciController, :calculate])
end

Rack::Handler::Puma.run(FibonacciApp, Port: 4000, Threads: ENV['THREAD_POOL'] || '0:5')
