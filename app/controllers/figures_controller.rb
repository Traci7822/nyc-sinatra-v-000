class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/figures") }

  get '/figures' do
    erb :index
  end

  get '/figures/new' do
    erb :new
  end

  post '/figures/new' do
    figure = Figure.create(params[:figure])
    figure.titles << Title.create(params[:title])
    figure.landmarks << Landmark.create(params[:landmark])
    figure.save
    redirect '/figures'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

  post '/figures/:id' do
    figure = Figure.find_by_id(params[:id])
    figure.update(name: params[:figure][:name])
    figure.titles << Title.create(params[:figure][:title_ids])
    figure.landscapes << Landscape.create(params[:landscapes])
    redirect "/figures/#{figure.id}"
  end

  get '/figures/:id/edit' do
    @figure = Figure.find_by_id(params[:id])
    erb :edit
  end

end
