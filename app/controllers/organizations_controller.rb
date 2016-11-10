class OrganizationController < ApplicationController

  get '/organizations' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get '/organizations/:id' do
    #debug
    @organization = Organization.find(params[:id])
    @experiences = UserExperience.all
    # if !logged_in?
    erb :"/organizations/show"
  end
end
