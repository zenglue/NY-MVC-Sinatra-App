class UserExperiancesController < ApplicationController

  get '/user-experiances/:id' do
    @experiance = UserExperiance.find(params[:id])
    erb :"/user_experiances/show"
  end

  end
end
