class OrganizationController < ApplicationController

  get '/organizations/index' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get '/organizations/:id' do
    @organization = Organization.find(params[:id])
#set organization id to new experiance organizaition id
#set link to create new experiance in view 
    erb :"/organizations/show"
  end
end
