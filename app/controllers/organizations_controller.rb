class OrganizationController < ApplicationController

  get '/organizations' do
    @organizations = Organization.all
    erb :"/organizations/index"
  end

  get '/organizations/:id' do
    #debug
    @organization = Organization.find(params[:id])
    @experiences = UserExperience.all
    @user = User.all
    # if logged_in?
    #   @user = current_user.slug
    # end
    erb :"/organizations/show"
  end
end
