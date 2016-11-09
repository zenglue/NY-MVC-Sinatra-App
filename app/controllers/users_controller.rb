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
      redirect "/organizations"
    else
      erb :"/users/login"
    end
  end

  get '/logout' do
    session.clear
    redirect "login"
  end

#get signup/flash session message


#get login/flash session message

#get logout/clear session/flash session message

#get users/:slug

#post signup...all fields filled, flash success/or error

#post login...athuneticate, flash error



end
