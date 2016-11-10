class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      redirect "/organizations"
    else
      erb :"/users/signup"
    end
  end

  get '/login' do
    if logged_in?
      redirect "/users/home"
    else
      #flash check your username or password
      erb :"/users/login"
    end
  end

  get '/logout' do

    session.clear
    #flash logged out
    redirect :'/'
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @experiences = UserExperience.all
    erb :"/users/home"
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      #flash notice[:session] "All fields must be filled"
      redirect "/signup"

    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:id] = @user.id
      #flash notice[:session] "Account successfuly created!"
      redirect "/organizations"
    end
  end

  post '/login' do

    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/organizations"
    else
      #flash notice[:session] "Wrong username or password"
      redirect "/login"
    end
  end
end
