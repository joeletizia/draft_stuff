require 'rails_helper'

describe Analytics::Age do
  describe ".calculate_average_position_ages" do
    it 'returns the average age of a given sport and position' do
      player_1 = Player.create(first_name: "Joe", last_name: "Letizia", position: "RF", age: 50, sport: "baseball")
      player_2 = Player.create(first_name: "Jose", last_name: "Letizia", position: "RF", age: 25, sport: "baseball")
      player_2 = Player.create(first_name: "John", last_name: "Letizia", position: "LF", age: 25, sport: "baseball")

      result = Analytics::Age.calculate_average_position_ages
      expect(result[{sport: 'baseball', position: 'RF'}]).to eq(37.5)
      expect(result[{sport: 'baseball', position: 'LF'}]).to eq(25)
    end
  end

  describe ".persist_average_ages" do
    it 'persists the average ages to the DB' do
      player_1 = Player.create(first_name: "Joe", last_name: "Letizia", position: "RF", age: 50, sport: "baseball")
      player_2 = Player.create(first_name: "Jose", last_name: "Letizia", position: "RF", age: 25, sport: "baseball")
      player_2 = Player.create(first_name: "John", last_name: "Letizia", position: "LF", age: 25, sport: "baseball")
      results_to_persist = Analytics::Age.calculate_average_position_ages
      Analytics::Age.persist_average_ages(results_to_persist)

      expect(AverageAge.count).to eq(2)
      right_field_average = AverageAge.where(sport: "baseball", position: "RF").first
      expect(right_field_average.age).to eq(37.5)

      left_field_average = AverageAge.where(sport: "baseball", position: "LF").first
      expect(left_field_average.age).to eq(25)
    end
  end
end
