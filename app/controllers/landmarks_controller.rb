class LandmarksController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/landmarks") }

  get '/landmarks' do
    erb :index
  end

  get '/landmarks/new' do
    erb :new
  end

  post '/landmarks/new' do
    landmark = Landmark.create(params[:landmark])
    landmark.figure = Figure.create(params[:figure])
    landmark.save
    redirect "/landmarks/#{landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :show
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find_by_id(params[:id])
    erb :edit
  end

  post '/landmarks/:id' do
    landmark = Landmark.find_by_id(params[:id])
    landmark.update(params[:landmark])
    redirect "/landmarks/#{landmark.id}"
  end
end
