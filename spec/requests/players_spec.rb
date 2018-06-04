require 'rails_helper'

describe "Players API endpoint" do
  describe "get single player" do
    it 'returns data for the given baseball player id' do
      player = Player.create(first_name: "Joe", last_name: "Letizia", position: "RF", age: 33, sport: "baseball")
      Analytics::Age.calculate_and_persist_average_position_ages()

      get "/players/#{player.id}"
      expect(response.content_type).to eq("application/json")
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["first_name"]).to eq("Joe")
      expect(parsed_body["last_name"]).to eq("Letizia")
      expect(parsed_body["position"]).to eq("RF")
      expect(parsed_body["age"]).to eq(33)
      expect(parsed_body["id"]).to eq(player.id)
      expect(parsed_body["name_brief"]).to eq("J.L.")
      expect(parsed_body["average_position_age_diff"]).to eq(0)
    end

    it 'returns data for the given football player id' do
      player = Player.create(first_name: "Joe", last_name: "Letizia", position: "RF", age: 33, sport: "football")
      Analytics::Age.calculate_and_persist_average_position_ages()

      get "/players/#{player.id}"
      expect(response.content_type).to eq("application/json")
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["name_brief"]).to eq("J. Letizia")
    end

    it 'returns data for the given basketball player id' do
      player = Player.create(first_name: "Joe", last_name: "Letizia", position: "RF", age: 33, sport: "basketball")
      Analytics::Age.calculate_and_persist_average_position_ages()

      get "/players/#{player.id}"
      expect(response.content_type).to eq("application/json")
      parsed_body = JSON.parse(response.body)
      expect(parsed_body["name_brief"]).to eq("Joe L.")
    end
  end
end
