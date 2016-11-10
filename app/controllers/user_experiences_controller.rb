class UserExperienceController < ApplicationController

  get '/user_experiences/new' do
    if logged_in?
      erb :"/user_experiences/new"
    else
      #add session error message
      redirect '/users/login'
    end
  end

  get '/user_experiences/:id' do
    if logged_in?
      @experience = UserExperience.find(params[:id])
      erb :"/user_experiences/show"
    else
      #add session error message
      redirect '/users/login'
    end
  end

  get '/user_experiences/:id/edit' do
    @experience = UserExperience.find(params[:id])
    if logged_in? && @experience.user_id == current_user.id
      erb :"/user_experiences/edit"
    else
      #add session error message
      redirect '/users/login'
    end
  end

  post '/user_experiences/new' do

    if (
      params[:needs_met_rating] != nil ||
      params[:accessibilty_rating] != nil ||
      params[:organization_response_rating] != nil ||
      !params[:experience_content].empty? ||
      !params[:advice_content].empty?)

      @experience = UserExperience.create(
      needs_met_rating: params[:needs_met_rating],
      accessibility_rating: params[:accessibilty_rating],
      organization_response_rating: params[:organization_response_rating],
      experience_content: params[:experience_content],
      advice_content: params[:advice_content])

      @experience.organization_id = params[:organization_id]
      @experience.user_id = current_user.id
      @experience.save
      redirect "/user_experiences/#{@experience.id}"
    else
      redirect "/organizations"
    end
  end

  patch '/user_experiences/:id/edit' do
    @experience = UserExperience.find(params[:id])
    params[:slug] = current_user.slug
    if logged_in? && @experience.user_id == current_user.id
      #deletes all content on update
      @experience.update(
      needs_met_rating: params[:needs_met_rating],
      accessibility_rating: params[:accessibilty_rating],
      organization_response_rating: params[:organization_response_rating],
      experience_content: params[:experience_content],
      advice_content: params[:advice_content])
      #flash session update sucessful
      redirect to "/users/#{params[:slug]}"
    else
      #flash session error message
      redirect "/login"
    end
  end

  delete '/user_experiences/:id/delete' do
    @experience = UserExperience.find(params[:id])
    if logged_in? && @experience.user_id == current_user.id
      @experience.destroy
      redirect "/organizations"
    else
      #flash session not logged_in message
      redirect "/organizations"
    end
  end
end