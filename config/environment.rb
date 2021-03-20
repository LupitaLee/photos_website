ENV['SINATRA_ENV'] ||= "development"



require "bundler/setup"Bundler.require
ActiveRecord::Base.establish_connection({  
      :adapter => "sqlite3",    
      :database => "db/development.sqlite3"})
require_all 'app'


require './app/controllers/application_controller'
