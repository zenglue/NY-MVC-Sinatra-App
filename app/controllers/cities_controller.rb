class CityController < ApplicationController
  get '/cities/index' do
    @cities = City.all
    erb :"cities/index"
  end
end
