require './app/controllers/controller.rb'
class Router < Controller

  def initialize(env)
    @routes = YAML.load_file('./app/config/routes.yml')
    @env = env
  end

  def run
    if @routes.include?(@env['REQUEST_PATH'])
      controller_name, action_name = @routes[@env['REQUEST_PATH']].split("#")
      klass = Object.const_get "#{controller_name.capitalize}Controller"
      klass.new.send(:"#{action_name}")
    else
      not_found
    end
  end
end
