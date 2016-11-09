class UserExperianceController < ApplicationController

  get '/user_experiances/new' do
    if logged_in?
      @organization = Organization.find(params[:id])
      erb :"/user_experiances/new"
    else
#add session error message
      redirect '/users/login'
    end
  end

  get '/user_experiances/:id' do
    if logged_in?
      @experiance = UserExperiance.find(params[:id])
      erb :"/user_experiances/show"
    else
#add session error message
      redirect '/users/login'
    end
  end

  get '/user_experiances/:id/edit' do
    @experiance = UserExperiance.find(params[:id])
    if logged_in? && @experiance.user_id == current_user.id
      erb :"/user_experiances/edit"
    else
#add session error message
      redirect '/users/login'
    end
  end

  get '/user_experiances/:id/delete' do
    if logged_in? && @experiance.user_id == current_user.id

  end

#post experiances new
# "needs_met_rating"
# "accessibility_rating"
# "organization_response_rating"
# "overall_experiance_rating"
# "experiance_content"
# "advice_content"

  post '/user_experiances/new' do
    if (
      params[:needs_met_rating] != nil ||
      params[:accessibilty_rating] != nil ||
      params[:organization_response_rating] != nil ||
      !params[:experiance_content].empty? ||
      !params[:advice_content].empty?)

      @organization = Organization.find(params[:id])
      @experiance = UserExperiance.new(
      needs_met_rating: params[:needs_met_rating],
      accessibility_rating: params[:accessibilty_rating],
      organization_response_rating: params[:organization_response_rating],
      experiance_content: params[:experiance_content],
      advice_content: params[:advice_content])

      # org_experiance = OrganizationExperiance.new
      # org_experiance.user_id =  current_user.id
      # org_experiance.org_id = ##Organization.id

      @experiance.organization_id = @organization.id
      @experiance.user_id = current_user.id
      @experiance.save
      redirect '/user_expreriance/#{@experiance.id}'
    end
  end

  patch '/user_experiance/:id/edit' do
    if logged_in? && @experiance.user_id == current_user.id
      @experiance = UserExperiance.find(params [:id])
      @experiance.update(
      needs_met_rating: params[:needs_met_rating],
      accessibility_rating: params[:accessibilty_rating],
      organization_response_rating: params[:organization_response_rating],
      experiance: params[:experiance_content],
      advice_content: params[:advice_content])
      #flash session update sucessful
      redirect "/organizations"
    else
      #flash session error message
      redirect "/login"
    end
  end

end
