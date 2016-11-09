class OrganizationController < ApplicationController

  get '/organizations' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get '/organizations/:id' do

    @organization = Organization.find(params[:id])

    erb :"/organizations/show"
  end

  get '/organizations/:id/new' do
    if logged_in?
      @organization = Organization.find(params[:id])
      erb :"/organizations/new"
    else
#add session error message
      redirect '/users/login'
    end
  end

  get '/organizations/:id/edit' do
    @experiance = UserExperiance.find(params[:id])
    if logged_in? && @experiance.user_id == current_user.id
      erb :"/user_experiances/edit"
    else
#add session error message
      redirect '/users/login'
    end
  end

  get '/organizations/:id/delete' do
    if logged_in? && @experiance.user_id == current_user.id

  end

  post '/organizations/:id/new' do
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

      @experiance.organization_id = @organization.id
      @experiance.user_id = current_user.id
      @experiance.save
      redirect '/user_expreriance/#{@experiance.id}'
    end
  end

  patch '/organizations/:id/edit' do
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
  # post '/organization/:id' do
  #   if logged_in?
  #
  #     @organization = Organization.find(params[:id])
  #     # @org_experiance = OrganizationExperiance.new
  #     # @org_experiance.organization_id = @organization.id
  #     # @org_experiance.user_id = current_user.id
  #     # @or_experiance.id
  #     # @org_experiance.save
  #   else
  #     # flash notice[:session] = "please login to record a new experiance"
  #     redirect '/users/login'
  #   end
  # end
