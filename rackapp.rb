require 'yaml'
require 'require_all'
require 'codebreaker_gem'
require_all './lib'
require_all './app/controllers'

class RackApp
  def call(env)
    [200, {"Content-Type" => "text/html"}, [""]]
  end
end

class GameMiddleware

  def initialize(app)
    @app = app
  end

  def call(env)
    $session = env['rack.session']
    $post = Rack::Request.new(env).POST
    router = Router.new(env).run
    status, headers, body = @app.call(env)
    [status, headers, body << router.body]
  end
end
