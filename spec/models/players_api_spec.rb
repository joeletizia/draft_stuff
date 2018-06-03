require 'rails_helper'

describe PlayersAPI do
  describe ".get_players_data", service: true do
    it 'returns player data from the api' do
      data = PlayersAPI.get_players_data('baseball')
      expect(data.count).to be > 2000

      bartolo = data.find do |datum|
        datum["firstname"] == "Bartolo" && datum["lastname"] == "Colon"
      end

      expect(bartolo["position"]).to eq("SP")
    end
  end

  describe ".translate_uri_for_sport" do
    it 'returns a translated uri for the given sport' do
      uri = PlayersAPI.translate_uri_for_sport('baseball', "http://example.com/<<sport>>")
      expect(uri).to eq('http://example.com/baseball')
    end
  end
end
