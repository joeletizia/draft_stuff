module Data::DataFetching
  SPORTS_TO_FETCH = ['baseball', 'football', 'basketball']

  module_function

  def get_and_persist_api_data(api_implementation = ::PlayersAPI)
    SPORTS_TO_FETCH.map do |sport|
      player_data = api_implementation.get_players_data(sport)
      persist_player_structs_for_sport(player_data, sport)

      true
    end
  end

  def persist_player_structs_for_sport(player_structs, sport)
    player_structs.map do |player_struct|
      ::Player.create!(first_name: player_struct["firstname"],
                       last_name: player_struct["lastname"],
                       position: player_struct["position"],
                       age: player_struct["age"],
                       sport: sport)
    end
  end
end
