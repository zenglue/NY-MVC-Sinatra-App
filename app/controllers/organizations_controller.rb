class OrganizationController < ApplicationController

  get '/organizations' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get 

  get '/organizations/:id' do
    @organization = Organization.find(params[:id])
    @experiences = UserExperience.all
    erb :"/organizations/show"
  end
end
