module PlayerPresentation
  module_function

  def build_player_data(player)
    presenter = sport_to_prentation_logic_mapping.fetch(player.sport)
    {
      id: player.id,
      first_name: player.first_name,
      last_name: player.last_name,
      position: player.position,
      age: player.age,
      name_brief: presenter.name_brief(player),
      average_position_age_diff: Analytics::Age.difference_between_player_and_average(player)
    }
  end

  def sport_to_prentation_logic_mapping
    {
      'baseball' => BaseballPlayerPresentation,
      'football' => FootballPlayerPresentation,
      'basketball' => BasketballPlayerPresentation,
    }
  end
end

module BaseballPlayerPresentation
  module_function

  def name_brief(player)
    first_name = player.first_name
    last_name = player.last_name

    "#{first_name[0]}.#{last_name[0]}."
  end
end

module FootballPlayerPresentation
  module_function

  def name_brief(player)
    first_name = player.first_name
    last_name = player.last_name

    "#{first_name[0]}. #{last_name}"
  end
end

module BasketballPlayerPresentation
  module_function

  def name_brief(player)
    first_name = player.first_name
    last_name = player.last_name

    "#{first_name} #{last_name[0]}."
  end
end
