class GamesController < ApplicationController
  require 'pry'
  def index
    # binding.pry
    @games = Game.all 
    render template: "games/index"
  end

  def get_games
    if params[:date]
      # p "inside date"
      month = params[:date].split("-")[0]
      # p month
      day = params[:date].split("-")[1]
      # p day
      @games = Game.where('extract(month  from scheduled) = ? AND extract(day  from scheduled) = ?', month, day).where.not(lat: nil)
    else
      @games = Game.where.not(lat: nil)
    end
    render 'get_games.json.jb'
  end
end
