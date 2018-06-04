require 'rails_helper'

describe "Sports API endpoint" do
  describe "get data for a sport" do
    it 'returns the players for the baseball sport' do
      player_1 = Player.create(first_name: "Joe", last_name: "Letizia", position: "RF", age: 33, sport: "baseball")
      player_2 = Player.create(first_name: "Lauren", last_name: "Letizia", position: "SP", age: 32, sport: "baseball")
      player_3 = Player.create(first_name: "Angie", last_name: "Letizia", position: "DH", age: 2, sport: "baseball")
      player_4 = Player.create(first_name: "Mike", last_name: "Letizia", position: "LF", age: 65, sport: "baseball")
      player_5 = Player.create(first_name: "Kevin", last_name: "Letizia", position: "C", age: 31, sport: "basketball")
      Analytics::Age.calculate_and_persist_average_position_ages()

      get "/sports/baseball"
      expect(response.content_type).to eq("application/json")
      parsed_body = JSON.parse(response.body)

      expect(parsed_body.count).to eq(4)
      joe = parsed_body.find{|i| i['first_name'] == 'Joe'}
      expect(joe['position']).to eq("RF")
      expect(joe['age']).to eq(33)
    end
  end
end
