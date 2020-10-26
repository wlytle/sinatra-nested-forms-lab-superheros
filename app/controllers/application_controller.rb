require "sinatra/base"

class App < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  get "/" do
    erb :team
  end

  post "/heros" do
    @team = Team.new(params["team"]["name"], params["team"]["motto"])
    @hero1 = Hero.new(params["team"]["members"][0])
    @hero2 = Hero.new(params["team"]["members"][1])
    @hero3 = Hero.new(params["team"]["members"][2])
    erb :super_hero
  end
end
