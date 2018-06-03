require "rails_helper"

describe Data::BaseballPlayerPersister do
  describe ".persist_player_structs" do
    it 'persists the given player structs' do
      player_structs = [{"first_name" => "Joe", "last_name" => "Letizia", "position" => "RF", "age" => 33}]
      Data::BaseballPlayerPersister.persist_player_structs(player_structs)
      expect(Players.count_of_all_players).to eq(1)
      expect(BaseballPlayer.count).to eq(1)

      player = BaseballPlayer.first
      expect(player.first_name).to eq("Joe")
      expect(player.last_name).to eq("Letizia")
      expect(player.position).to eq("RF")
      expect(player.age).to eq(33)
    end
  end
end
