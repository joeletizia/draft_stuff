require 'rails_helper'

describe Data::DataFetching do
  describe ".get_and_persist_api_data" do
    it 'retrieves data from the configured API and persists it to the db' do
      Data::DataFetching.get_and_persist_api_data()
      expect(Players.count_of_all_players).to be > 0
    end
  end

  describe ".translate_uri_for_sport" do
    it 'returns a translated uri for the given sport' do
      result = Data::DataFetching.translate_uri_for_sport('baseball', 'http://example.com/<<sport>>')
      expect(result).to eq('http://example.com/baseball')
    end
  end
end
