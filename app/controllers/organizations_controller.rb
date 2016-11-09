class OrganizationController < ApplicationController

  get '/organizations/index' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get '/organizations/:id' do

    @organization = Organization.find(params[:id])


    erb :"/organizations/show"
  end

  get '/organization/:id/new' do
    if logged_in?

      @organization = Organization.find(params[:id])
      org_experiance = OrganizationExperiance.new
      org_experiance.organization_id = @organization.id
      org_experiance.user_id = current_user.id
      org_experiance.save
    #set link to create new experiance/ratings in view
      redirect '/experiances/new'
    else
      # flash notice[:session] = "please login to record a new experiance"
      redirect '/users/login'
    end






end
