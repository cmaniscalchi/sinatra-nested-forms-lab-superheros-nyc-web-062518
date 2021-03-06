require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :super_hero
  end

  post '/teams' do
    @team = Team.new(params[:team])
    params[:team][:superheroes].each do |hero|
      Superhero.new(hero)
    end

    @superheroes = Superhero.all

    erb :teams
  end

  get '/teams' do
    erb :teams
  end

end
