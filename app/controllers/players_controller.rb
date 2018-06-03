class PlayersController < ApplicationController
  def show
    player_id = params[:id]
    player = Player.find(player_id)

    player_struct = PlayerPresentation.build_player_data(player)
    render json: player_struct
  end
end
