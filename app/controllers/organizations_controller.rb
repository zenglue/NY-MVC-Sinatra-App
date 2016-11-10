class OrganizationController < ApplicationController

  get '/organizations' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get '/organizations/:id' do
    @organization = Organization.find(params[:id])
    erb :"/organizations/show"
  end

  # get '/organizations/:id/new' do
  #   if logged_in?
  #     organization = Organization.find_by(id: params[:id])
  #     erb :"/organizations/new"
  #   else
  #   #add session error message
  #     redirect '/users/login'
  #   end
  # end
  #
  # post '/organizations/:id/new' do
  #   @organization = Organization.find(params[:id])
  #
  #   if (
  #     params[:needs_met_rating] != nil ||
  #     params[:accessibilty_rating] != nil ||
  #     params[:organization_response_rating] != nil ||
  #     !params[:experience_content].empty? ||
  #     !params[:advice_content].empty?)
  #
  #     @organization = Organization.find(params[:id])
  #     @experience = UserExperience.new(
  #     needs_met_rating: params[:needs_met_rating],
  #     accessibility_rating: params[:accessibilty_rating],
  #     organization_response_rating: params[:organization_response_rating],
  #     experience_content: params[:experience_content],
  #     advice_content: params[:advice_content])
  #
  #     @experience.organization_id = @organization.id
  #     @experience.user_id = current_user.id
  #     @experience.save
  #
  #     redirect '/organizations/#{@organization.id}'
  #   end
  # end
end

  # post '/organization/:id' do
  #   if logged_in?
  #
  #     # @organization = Organization.find(params[:id])
  #     # @org_experience = OrganizationExperience.new
  #     # @org_experience.organization_id = @organization.id
  #     # @org_experience.user_id = current_user.id
  #     # @org_experience.id
  #     # @org_experience.save
  #
  #   #set link to create new experiance/ratings in view
  #     redirect '/experiances/new'
  #   else
  #     # flash notice[:session] = "please login to record a new experiance"
  #     redirect '/users/login'
  #   end
  # end
