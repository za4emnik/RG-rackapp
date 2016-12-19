require './rackapp.rb'
require 'pp'
use Rack::Reloader
use Rack::Session::Pool
use GameMiddleware
run RackApp.new
