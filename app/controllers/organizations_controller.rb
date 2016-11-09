class OrganizationController < ApplicationController

  get '/organizations' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get '/organizations/:id' do

    @organization = Organization.find(params[:id])

    erb :"/organizations/show"
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






end
