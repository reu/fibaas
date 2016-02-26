require "bundler"
Bundler.require
require "action_controller/railtie"

class Fibonacci < Rails::Application
  config.eager_load = true
  config.cache_classes = true
  config.secret_key_base = "6483b0467fb65f26b56dca618ed499378884d08b888d3c04cf9a3ce4a198"
  config.logger = nil

  config.middleware.delete "Rack::Sendfile"
  config.middleware.delete "ActionDispatch::Static"
  config.middleware.delete "Rack::MethodOverride"
  config.middleware.delete "ActionDispatch::RequestId"
  config.middleware.delete "Rails::Rack::Logger"
  config.middleware.delete "ActionDispatch::ShowExceptions"
  config.middleware.delete "ActionDispatch::DebugExceptions"
  config.middleware.delete "ActionDispatch::RemoteIp"
  config.middleware.delete "ActionDispatch::Callbacks"
  config.middleware.delete "ActionDispatch::Cookies"
  config.middleware.delete "ActionDispatch::Session::CookieStore"
  config.middleware.delete "ActionDispatch::Flash"
  config.middleware.delete "Rack::Head"
  config.middleware.delete "Rack::ConditionalGet"
  config.middleware.delete "Rack::ETag"

  routes.append do
    get "/:number" => "fibonacci#show"
  end
end

class FibonacciController < ActionController::Metal
  include AbstractController::Rendering
  include ActionController::Rendering

  def fib(n)
    case n
      when 0 then 0
      when 1 then 1
      else fib(n - 1) + fib(n - 2)
    end
  end

  def show
    render text: fib(params[:number].to_i).to_s
  end
end

Fibonacci.initialize!

Rack::Handler::Puma.run Fibonacci,
  Port: 4000,
  Environment: "production",
  Threads: "4:16"
