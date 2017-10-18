class FiguresController < ApplicationController

  get '/figures/new' do
    erb :'figures/new'
  end

  post '/figures' do
    # binding.pry
    # params.to_s
    @figure = Figure.create(params["figure"])
    if !params[:landmark][:name].empty?
      @figure.landmarks << Landmark.create(params[:landmark])
    end
    if !params[:title][:name].empty?
      @figure.titles << Title.create(params[:title])
    end
    @figure.save
    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  get '/figures/:id' do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

end
