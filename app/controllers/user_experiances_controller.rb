class UserExperiancesController < ApplicationController

  get '/experiances/new' do
    if logged_in?
      erb :"/user_experiances/new"
    else
      redirect '/users/login'
    end
  end

  get '/experiances/:id' do
    if logged_in?
    @experiance = UserExperiance.find(params[:id])
    erb :"/user_experiances/show"
  end

end
