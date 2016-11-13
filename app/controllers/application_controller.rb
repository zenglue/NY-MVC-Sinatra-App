require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "security"
  end

  get '/' do
    erb :"/home"
  end

  helpers do

    def logged_in?
      !!session[:id]
    end

    def current_user
      User.find(session[:id])
    end
  end
end
