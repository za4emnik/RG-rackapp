require './rackapp.rb'
require 'pp'
use Rack::Reloader
use Rack::Session::Pool
use Rack::Static, :urls => ["/app/assets"]
use GameMiddleware
run RackApp.new
