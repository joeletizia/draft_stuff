module Analytics::Age
  module_function

  def calculate_average_position_ages()
    sport_position_tuples = unique_positions_across_all_players_and_sports()

    sport_position_tuples.reduce({}) do |acc, sport_position|
      sport, position = sport_position

      average_age = average_age_for_sport_position(sport, position)
      key = {sport: sport, position: position}
      acc[key] = average_age
      acc
    end
  end

  def unique_positions_across_all_players_and_sports()
    ['baseball', 'football', 'basketball'].reduce([]) do |acc, sport|
      sport_positions = Player.where(sport: sport).pluck(:position).uniq.reduce([]) do |acc, position|
        acc << [sport, position]
        acc
      end

      acc.concat(sport_positions)
    end
  end

  def average_age_for_sport_position(sport, position)
    Player.where(sport: sport, position: position).average(:age)
  end

  def persist_average_ages(averages)
    averages.map do |sport_position_map, age|
      sport = sport_position_map[:sport]
      position = sport_position_map[:position]
      ::AverageAge.create!(sport: sport, position: position, age: age)
    end
  end
end
