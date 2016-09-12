class FiguresController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/figures") }

  get '/figures' do
    erb :index
  end

  get '/figures/new' do
    erb :new
  end

  post '/figures/new' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
    @figure.save
    redirect '/figures'
  end

  get '/figures/:id' do 
    @figure = Figure.find(params[:id])
    redirect '/figures/#{id}/show'
  end

  get '/figures/:id/show' do
    binding.pry
    erb :show
  end

end
