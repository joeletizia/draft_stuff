class SportsController < ApplicationController
  def show
    sport = params[:sport]
    players = Players.for_sport(sport)

    render json: players
  end
end
