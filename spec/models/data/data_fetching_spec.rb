require 'rails_helper'

describe Data::DataFetching do
  describe ".get_and_persist_api_data" do
    it 'retrieves data from the configured API and persists it to the db' do
      Data::DataFetching.get_and_persist_api_data(FakePlayersAPI)
      expect(Player.count).to eq(3)
    end
  end


  describe ".get_and_persist_api_data", service: true do
    it 'retrieves data from the configured API and persists it to the db' do
      Data::DataFetching.get_and_persist_api_data()
      expect(Player.count).to be > 0
    end
  end

end

module FakePlayersAPI
  module_function

  def get_players_data(sport)
    player = {first_name: 'Joe', last_name: 'Letizia', age: 33, position: "RF", sport: sport}
    [player]
  end
end
