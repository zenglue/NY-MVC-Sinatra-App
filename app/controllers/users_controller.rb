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
      redirect "/users/#{current_user.slug}"
    else
      erb :"/users/login"
    end
  end

  get '/logout' do
    log_out
    redirect "/"
  end

  get '/users/:slug' do
    @user = User.find_by_slug(params[:slug])
    @experiences = UserExperience.all
    if @user && logged_in?
      erb :"/users/home"
    else
      redirect "/login"
    end
  end

  post '/signup' do
    if params[:username].empty? || params[:email].empty? || params[:password].empty?
      redirect "/signup"
    else
      @user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password])
      @user.save
      session[:id] = @user.id
      redirect "/organizations"
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:id] = @user.id
      redirect "/users/#{current_user.slug}"
    else
      redirect "/login"
    end
  end
end
