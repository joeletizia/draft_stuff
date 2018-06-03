module Data::BaseballPlayerPersister
  module_function

  def persist_player_structs(player_structs)
    player_structs.map do |player_struct|
      BaseballPlayer.create!(first_name: player_struct["first_name"],
                             last_name: player_struct["last_name"],
                             position: player_struct["position"],
                             age: player_struct["age"])
    end
  end
end
