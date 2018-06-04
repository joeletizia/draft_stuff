module Players
  module_function

  def for_sport(sport)
    players = Player.where(sport: sport)
    players.map do |player|
      PlayerPresentation.build_player_data(player)
    end
  end
end
