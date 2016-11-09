class ExperianceController < ApplicationController

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
    if logged_in? && @experiance.id == current_user.id
      erb :"/experiances/edit"
    else
#add session error message
      redirect '/users/login'
    binding.pry
    end
  end

#post experiances new
# "needs_met_rating"
# "accessibility_rating"
# "organization_response_rating"
# "overall_experiance_rating"
# "experiance_content"
# "advice_content"

  post '/experiances/new' do
    if (params[:needs_met_rating] != nil ||
      params[:accessibilty_rating] != nil ||
      params[:organization_response_rating] != nil ||
      !params[:experiance_content].empty? ||
      !params[:advice_content].empty?)

      @experiance = UserExperiance.new(neeeds_met_rating: params[:needs_met_rating],
      accessibilty_rating: params[:accessibilty_rating],
      organization_response_rating: params[:organization_response_rating],
      experiance_content: params[:experiance_content],
      advice_content: params[:advice_content])

      # org_experiance = OrganizationExperiance.new
      # org_experiance.user_id =  current_user.id
      # org_experiance.org_id = ##Organization.id
      @experiance.id = org_experiance.id
      @experiance.save

      redirect '/expreriance/#{@experiance.id}'
    end

  end

#patch experiances/:id/edit flash/action

#delete experiances/:id/delete flash/action


end
