class OrganizationController < ApplicationController

  get 'organizations/index' do
    @organization = Organization.all
    erb :"/organizations/index"
  end

  get 'organizations/:id' do
    @organization = Organization.find(params[:id])
    erb :"/organizations/show"
  end
end
