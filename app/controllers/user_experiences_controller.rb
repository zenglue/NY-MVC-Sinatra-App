class UserExperienceController < ApplicationController

  get '/user_experiences/new' do
    if logged_in?
      erb :"/user_experiences/new"
    else
      redirect "/login"
    end
  end

  get '/user_experiences/:id' do
    if logged_in?
      @experience = UserExperience.find(params[:id])
      erb :"/user_experiences/show"
    else
      redirect "/login"
    end
  end

  get '/user_experiences/:id/edit' do
    @experience = UserExperience.find(params[:id])
    if logged_in? && @experience.user_id = current_user.id
      erb :"/user_experiences/edit"
    else
      erb :"/login"
    end
  end

  post '/user_experiences/new' do
    if logged_in? && (
      !params[:experience_content].empty? ||
      !params[:advice_content].empty?)

      @experience = UserExperience.new(
      experience_content: params[:experience_content],
      advice_content: params[:advice_content])

      @experience.organization_id = params[:organization_id]
      @experience.user_id = current_user.id
      @experience.save
      redirect "/organizations/#{params[:organization_id]}"
    else
      redirect "/organizations/#{params[:organization_id]}"
    end
  end

  patch '/user_experiences/:id' do
    @experience = UserExperience.find(params[:id])
    @experience.update(
    experience_content: params[:experience_content],
    advice_content: params[:advice_content])
    redirect "/users/#{current_user.slug}"
  end

  delete '/user_experiences/:id' do
    @experience = UserExperience.find(params[:id])
    if logged_in? && @experience.user_id = current_user.id
      @experience.destroy
      redirect "/users/#{current_user.slug}"
    else
      redirect "/login"
    end
  end
end
