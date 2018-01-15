require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/job.rb'
require_relative './controllers/jobs_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run JobsController