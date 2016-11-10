class UserController < ApplicationController

  get '/signup' do
    if logged_in?
      #flash already logged_in
      redirect "/organizations"
    else
      erb :"/users/signup"
    end
  end

  get '/login' do
    if logged_in?
      params[:slug] = current_user.slug
      redirect "/users/:slug"
    else
      #flash check your username or password
      erb :"/users/login"
    end
  end

  get '/logout' do
    session.clear
    #flash logged out
    redirect "/"
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
      #User.new can be nested name[:att_hash]
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:id] = @user.id
      #flash notice[:session] "Account successfuly created!"
      redirect "/organizations"
    end
  end

  post '/login' do
    #hidden input tag to store 'if' for redirect
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/organizations"
      # redirect "/organizations/:id"
    else
      #flash notice[:session] "Wrong username or password"
      redirect "/login"
    end
  end
end
