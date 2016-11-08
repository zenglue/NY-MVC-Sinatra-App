class OrganizationController < ApplicationController
  get 'organizations/:id' do
    @organization = Organization.find(params[:id])
    erb :"/organizations/show"
  end
end
