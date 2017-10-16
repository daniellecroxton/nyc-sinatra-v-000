class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id/edit' do
    erb :'landmarks/edit'
  end

  get '/landmarks/:id' do
    erb :'landmarks/show'
  end

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end
end
