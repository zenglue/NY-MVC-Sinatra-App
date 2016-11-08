class ExperiancesController < ApplicationController

  get '/experiances/new' do
    if logged_in?
      erb :"/user_experiances/new"
    else
#add session error message
      redirect '/users/login'
    end
  end

  get '/experiances/:id' do
    if logged_in?
      @experiance = UserExperiance.find(params[:id])
      erb :"/experiances/show"
    else
#add session error message
      redirect '/users/login'
    end
  end

  get '/experiances/:id/edit' do
    @experiance = UserExperiance.find(params[:id])
    if logged_in? && @experiance.user_id == current_user.id
      erb :"/experiances/edit"
    else
#add session error message
      redirect '/users/login'
    binding.pry
    end
  end

#post experiances new

#patch experiances/:id/edit flash/action

#delete experiances/:id/delete flash/action


end
